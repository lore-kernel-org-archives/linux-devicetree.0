From: Moritz Fischer <moritz.fischer-+aYTwkv1SeIAvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH] Documentation: arm: Fixed typo in socfpga fpga mgr example
Date: Thu, 29 Oct 2015 13:47:21 -0700
Message-ID: <CAAtXAHcaz4tZNzGuD6CKkBcrFujSA=47jd_C61YTYqCCaTdQqw@mail.gmail.com>
References: <1446151622-7306-1-git-send-email-moritz.fischer@ettus.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1446151622-7306-1-git-send-email-moritz.fischer-+aYTwkv1SeIAvxtiuMwx3w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: "pawel.moll-5wv7dgnIgG8@public.gmane.org" <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Alan Tull <atull-yzvPICuk2ABMcg4IHK0kFoH6Mc4MB0Vx@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Moritz Fischer <moritz.fischer-+aYTwkv1SeIAvxtiuMwx3w@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Thu, Oct 29, 2015 at 1:47 PM, Moritz Fischer
<moritz.fischer-+aYTwkv1SeIAvxtiuMwx3w@public.gmane.org> wrote:
> Addresses should not be prefixed contain '0x' in nodes.
>
> Signed-off-by: Moritz Fischer <moritz.fischer-+aYTwkv1SeIAvxtiuMwx3w@public.gmane.org>
> ---
>  Documentation/devicetree/bindings/fpga/altera-socfpga-fpga-mgr.txt | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/Documentation/devicetree/bindings/fpga/altera-socfpga-fpga-mgr.txt b/Documentation/devicetree/bindings/fpga/altera-socfpga-fpga-mgr.txt
> index 9b027a6..823f3d6 100644
> --- a/Documentation/devicetree/bindings/fpga/altera-socfpga-fpga-mgr.txt
> +++ b/Documentation/devicetree/bindings/fpga/altera-socfpga-fpga-mgr.txt
> @@ -9,7 +9,7 @@ Required properties:
>
>  Example:
>
> -       hps_0_fpgamgr: fpgamgr@0xff706000 {
> +       hps_0_fpgamgr: fpgamgr@0ff706000 {

*grrr* ... should've been fpgamgr@ff706000 obviously ...

>                 compatible = "altr,socfpga-fpga-mgr";
>                 reg = <0xFF706000 0x1000
>                        0xFFB90000 0x1000>;
> --
> 2.6.2
>
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
