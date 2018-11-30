From: Arnd Bergmann <arnd@arndb.de>
Subject: Re: [RFC PATCH 3/6] char: fastrpc: Add support for context Invoke method
Date: Fri, 30 Nov 2018 14:41:04 +0100
Message-ID: <CAK8P3a1mFWJyXCn74_Yd_y3Df0JN=qM4nw4-2t_LjRO7yXmXBw@mail.gmail.com>
References: <20181130104657.14875-1-srinivas.kandagatla@linaro.org> <20181130104657.14875-4-srinivas.kandagatla@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20181130104657.14875-4-srinivas.kandagatla@linaro.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Cc: Rob Herring <robh+dt@kernel.org>, gregkh <gregkh@linuxfoundation.org>, Mark Rutland <mark.rutland@arm.com>, DTML <devicetree@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Bjorn Andersson <bjorn.andersson@linaro.org>, linux-arm-msm@vger.kernel.org, bkumar@qti.qualcomm.com, thierry.escande@linaro.org
List-Id: devicetree@vger.kernel.org

On Fri, Nov 30, 2018 at 11:48 AM Srinivas Kandagatla
<srinivas.kandagatla@linaro.org> wrote:
>
> This patch adds support to compute context invoke method
> on the remote processor (DSP).
> This involves setting up the functions input and output arguments,
> input and output handles and mapping the dmabuf fd for the
> argument/handle buffers.
>
> Most of the work is derived from various downstream Qualcomm kernels.
> Credits to various Qualcomm authors who have contributed to this code.
> Specially Tharun Kumar Merugu <mtharu@codeaurora.org>
>
> Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>

> +
> +       INIT_LIST_HEAD(&ctx->node);
> +       ctx->fl = user;
> +       ctx->maps = (struct fastrpc_map **)(&ctx[1]);
> +       ctx->lpra = (remote_arg_t *)(&ctx->maps[bufs]);
> +       ctx->fds = (int *)(&ctx->lpra[bufs]);
> +       ctx->attrs = (unsigned int *)(&ctx->fds[bufs]);
> +
> +       if (!kernel) {
> +               if (copy_from_user(ctx->lpra,
> +                                    (void const __user *)inv->pra,
> +                                    bufs * sizeof(*ctx->lpra))) {
> +                       err = -EFAULT;
> +                       goto err;
> +               }
> +
> +               if (inv->fds) {
> +                       if (copy_from_user(ctx->fds,
> +                                            (void const __user *)inv->fds,
> +                                            bufs * sizeof(*ctx->fds))) {
> +                               err = -EFAULT;
> +                               goto err;
> +                       }
> +               }
> +               if (inv->attrs) {
> +                       if (copy_from_user(
> +                                       ctx->attrs,
> +                                       (void const __user *)inv->attrs,
> +                                       bufs * sizeof(*ctx->attrs))) {
> +                               err = -EFAULT;
> +                               goto err;
> +                       }
> +               }
> +       } else {
> +               memcpy(ctx->lpra, inv->pra, bufs * sizeof(*ctx->lpra));
> +               if (inv->fds)
> +                       memcpy(ctx->fds, inv->fds,
> +                              bufs * sizeof(*ctx->fds));
> +               if (inv->attrs)
> +                       memcpy(ctx->attrs, inv->attrs,
> +                              bufs * sizeof(*ctx->attrs));
> +       }

I'd split this function into multiple pieces: the internal one that
just takes kernel pointers, and a wrapper for the ioctl
that copies the user space data into the kernel before calling
the second one.

> +static int fastrpc_put_args(struct fastrpc_invoke_ctx *ctx,
> +                           uint32_t kernel, remote_arg_t *upra)
> +{
> +       remote_arg64_t *rpra = ctx->rpra;
> +       int i, inbufs, outbufs, handles;
> +       struct fastrpc_invoke_buf *list;
> +       struct fastrpc_phy_page *pages;
> +       struct fastrpc_map *mmap;
> +       uint32_t sc = ctx->sc;
> +       uint64_t *fdlist;
> +       uint32_t *crclist;
> +       int err = 0;
> +
> +       inbufs = REMOTE_SCALARS_INBUFS(sc);
> +       outbufs = REMOTE_SCALARS_OUTBUFS(sc);
> +       handles = REMOTE_SCALARS_INHANDLES(sc) + REMOTE_SCALARS_OUTHANDLES(sc);
> +       list = fastrpc_invoke_buf_start(ctx->rpra, sc);
> +       pages = fastrpc_phy_page_start(sc, list);
> +       fdlist = (uint64_t *)(pages + inbufs + outbufs + handles);
> +       crclist = (uint32_t *)(fdlist + FASTRPC_MAX_FDLIST);
> +
> +       for (i = inbufs; i < inbufs + outbufs; ++i) {
> +               if (!ctx->maps[i]) {
> +                       if (!kernel)
> +                               err =
> +                               copy_to_user((void __user *)ctx->lpra[i].buf.pv,
> +                                      (void *)rpra[i].buf.pv, rpra[i].buf.len);
> +                       else
> +                               memcpy(ctx->lpra[i].buf.pv,
> +                                      (void *)rpra[i].buf.pv, rpra[i].buf.len);
> +
> +                       if (err)
> +                               goto bail;
> +               } else {
> +                       fastrpc_map_put(ctx->maps[i]);
> +                       ctx->maps[i] = NULL;
> +               }
> +       }

Same here.

> +static int fastrpc_internal_invoke(struct fastrpc_user *fl,
> +                                  uint32_t kernel,
> +                                  struct fastrpc_ioctl_invoke *inv)
> +{
> +       struct fastrpc_invoke_ctx *ctx = NULL;
> +       int err = 0;
> +
> +       if (!fl->sctx)
> +               return -EINVAL;
> +
> +       ctx = fastrpc_context_alloc(fl, kernel, inv);
> +       if (IS_ERR(ctx))
> +               return PTR_ERR(ctx);
> +
> +       if (REMOTE_SCALARS_LENGTH(ctx->sc)) {
> +               err = fastrpc_get_args(kernel, ctx);
> +               if (err)
> +                       goto bail;
> +       }
> +
> +       err = fastrpc_invoke_send(fl->sctx, ctx, kernel, inv->handle);
> +       if (err)
> +               goto bail;
> +
> +       err = wait_for_completion_interruptible(&ctx->work);
> +       if (err)
> +               goto bail;

Can you add comments here to explain the control flow?
What exactly are we waiting for here? Does the completion
indicate that the remote side is done executing the code
and ready to do something else?

> +static long fastrpc_device_ioctl(struct file *file, unsigned int cmd,
> +                                unsigned long arg)
> +{
> +       struct fastrpc_user *fl = (struct fastrpc_user *)file->private_data;
> +       struct fastrpc_channel_ctx *cctx = fl->cctx;
> +       char __user *argp = (char __user *)arg;
> +       int err;
> +
> +       if (!fl->sctx) {
> +               fl->sctx = fastrpc_session_alloc(cctx, 0);
> +               if (!fl->sctx)
> +                       return -ENOENT;
> +       }

Shouldn't that session be allocated during open()?

> +static void fastrpc_notify_users(struct fastrpc_user *user)
> +{
> +       struct fastrpc_invoke_ctx *ctx, *n;
> +
> +       spin_lock(&user->lock);
> +       list_for_each_entry_safe(ctx, n, &user->pending, node)
> +               complete(&ctx->work);
> +       spin_unlock(&user->lock);
> +}

Can you explain here what it means to have multiple 'users' for
a 'fastrpc_user' structure? Why are they all done at the same time?

> +struct remote_dma_handle64 {
> +       int fd;
> +       uint32_t offset;
> +       uint32_t len;
> +};

Maybe always make the offset/len fields and others 64 bit?

> +union remote_arg64 {
> +       struct remote_buf64     buf;
> +       struct remote_dma_handle64 dma;
> +       uint32_t h;
> +};
> +
> +#define remote_arg_t    union remote_arg
> +
> +struct remote_buf {
> +       void *pv;               /* buffer pointer */
> +       size_t len;             /* length of buffer */
> +};
> +
> +struct remote_dma_handle {
> +       int fd;
> +       uint32_t offset;
> +};
> +
> +union remote_arg {
> +       struct remote_buf buf;  /* buffer info */
> +       struct remote_dma_handle dma;
> +       uint32_t h;             /* remote handle */
> +};

Try to avoid the padding at the end of the structure,
if you can't, then add a __reserved member.

I'd also recommend avoiding nested structures and
unions. Add more commands if necessary.

> +struct fastrpc_ioctl_invoke {
> +       uint32_t handle;        /* remote handle */
> +       uint32_t sc;            /* scalars describing the data */
> +       remote_arg_t *pra;      /* remote arguments list */
> +       int *fds;               /* fd list */
> +       unsigned int *attrs;    /* attribute list */
> +       unsigned int *crc;
> +};

This seems too complex for an ioctl argument, with
multiple levels of pointer indirections. I'd normally
try to make each ioctl argument either a scalar, or a
structure with only fixed-length members.

The way we did this in spufs was to set up a context
first with all the information it needed, and make the
actual context switch from host CPU to remote a very
simple operation that took as few arguments as possible,
in case of spu_run() only the instruction pointer and
the location of the return status.

      Arnd
