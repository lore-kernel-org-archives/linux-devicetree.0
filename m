From: Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: Re: [RFC 5/5] tty: Update hypervisor tty drivers to use core stdout parsing code.
Date: Fri, 28 Mar 2014 14:41:35 -0700
Message-ID: <20140328214135.36027C41FF4@trevor.secretlab.ca>
References: <1396022885-6102-1-git-send-email-grant.likely@linaro.org> < 1396022885-6102-6-git-send-email-grant.likely@linaro.org> <20140328185443. GA26433@quad.lixom.net>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20140328185443.GA26433-O5ziIzlqnXUVNXGz7ipsyg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, christoffer.dall-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, benh-XVmvHMARGAS8U2dJNN8I7kB+6BGkLq7r@public.gmane.org, rob.herring-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Fri, 28 Mar 2014 11:54:43 -0700, Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org> wrote:
> On Fri, Mar 28, 2014 at 09:08:05AM -0700, Grant Likely wrote:
> > diff --git a/drivers/tty/ehv_bytechan.c b/drivers/tty/ehv_bytechan.c
> > index 0419b69e270f..4f485e88f60c 100644
> > --- a/drivers/tty/ehv_bytechan.c
> > +++ b/drivers/tty/ehv_bytechan.c
> > @@ -108,55 +108,23 @@ static void disable_tx_interrupt(struct ehv_bc_data *bc)
> >   *
> >   * The byte channel to be used for the console is specified via a "stdout"
> >   * property in the /chosen node.
> > - *
> > - * For compatible with legacy device trees, we also look for a "stdout" alias.
> >   */
> 
> Did you mean to remove this /aliases/stdout checking? Based on the comment it
> seems that some older device trees / platforms might rely on it?

I moved it to the common code.

> > diff --git a/drivers/tty/hvc/hvc_opal.c b/drivers/tty/hvc/hvc_opal.c
> > index b01659bd4f7c..0ec1a80dd6a2 100644
> > --- a/drivers/tty/hvc/hvc_opal.c
> > +++ b/drivers/tty/hvc/hvc_opal.c
> > @@ -322,22 +322,14 @@ static void udbg_init_opal_common(void)
> >  
> >  void __init hvc_opal_init_early(void)
> >  {
> > -	struct device_node *stdout_node = NULL;
> > +	struct device_node *stdout_node = of_node_get(of_stdout);
> >  	const __be32 *termno;
> >  	const char *name = NULL;
> 
> Name is no longer used, should be removed.

Fixed, thanks.

g.
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
