From: Andy Shevchenko <andy.shevchenko@gmail.com>
Subject: Re: [PATCH v3 06/12] usb: dwc3: Increase timeout for CmdAct cleared
 by device controller
Date: Sat, 2 Mar 2019 17:47:23 +0200
Message-ID: <CAHp75Vd+wPU_QvaWHanpG6hjnUj6==4Y3YiOtZnWpk0kyFUQ4A@mail.gmail.com>
References: <20190302090505.65542-1-chenyu56@huawei.com> <20190302090505.65542-7-chenyu56@huawei.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190302090505.65542-7-chenyu56@huawei.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Yu Chen <chenyu56@huawei.com>
Cc: USB <linux-usb@vger.kernel.org>, devicetree <devicetree@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, John Stultz <john.stultz@linaro.org>, Suzhuangluan <suzhuangluan@hisilicon.com>, Kongfei <kongfei@hisilicon.com>, liuyu712@hisilicon.com, wanghu17@hisilicon.com, butao@hisilicon.com, Yao Chen <chenyao11@huawei.com>, fangshengzhou@hisilicon.com, lipengcheng8@huawei.com, songxiaowei <songxiaowei@hisilicon.com>, xu yiping <xuyiping@hisilicon.com>, xuyoujun4@huawei.com, yudongbin@hisilicon.com, zangleigang@hisilicon.com, Felipe Balbi <balbi@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Binghui Wang <wangbinghui@hisilicon.com>
List-Id: devicetree@vger.kernel.org

On Sat, Mar 2, 2019 at 11:06 AM Yu Chen <chenyu56@huawei.com> wrote:
>
> It needs more time for the device controller to clear the CmdAct of
> DEPCMD on Hisilicon Kirin Soc.
>

5x times more? Can you provide more specific details on that?

> Cc: Andy Shevchenko <andy.shevchenko@gmail.com>
> Cc: Felipe Balbi <balbi@kernel.org>
> Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> Cc: John Stultz <john.stultz@linaro.org>
> Cc: Binghui Wang <wangbinghui@hisilicon.com>
> Signed-off-by: Yu Chen <chenyu56@huawei.com>
> ---
>  drivers/usb/dwc3/gadget.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/usb/dwc3/gadget.c b/drivers/usb/dwc3/gadget.c
> index 6c9b76bcc2e1..84d701b37171 100644
> --- a/drivers/usb/dwc3/gadget.c
> +++ b/drivers/usb/dwc3/gadget.c
> @@ -270,7 +270,7 @@ int dwc3_send_gadget_ep_cmd(struct dwc3_ep *dep, unsigned cmd,
>  {
>         const struct usb_endpoint_descriptor *desc = dep->endpoint.desc;
>         struct dwc3             *dwc = dep->dwc;
> -       u32                     timeout = 1000;
> +       u32                     timeout = 5000;
>         u32                     saved_config = 0;
>         u32                     reg;
>
> --
> 2.15.0-rc2
>


-- 
With Best Regards,
Andy Shevchenko
