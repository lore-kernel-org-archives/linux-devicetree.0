From: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH V2 1/4] Documentation: pv88080: Move binding document
Date: Sun, 30 Oct 2016 23:44:03 -0500
Message-ID: <20161031044403.a34ylc6tpbp2pg7h@rob-hp-laptop>
References: <cover.1477530195.git.eric.jeong@diasemi.com>
 <4e0bd042e35f13c06511ca9b3f790b5ceaf34451.1477530195.git.eric.jeong@diasemi.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <4e0bd042e35f13c06511ca9b3f790b5ceaf34451.1477530195.git.eric.jeong-WBD+wuPFNBhBDgjK7y7TUQ@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Eric Jeong <eric.jeong.opensource-WBD+wuPFNBhBDgjK7y7TUQ@public.gmane.org>
Cc: DEVICETREE <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, LINUX-KERNEL <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Alexandre Courbot <gnurou-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, LINUX-GPIO <linux-gpio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Lee Jones <lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Liam Girdwood <lgirdwood-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Mark Brown <broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Support Opensource <support.opensource-WBD+wuPFNBhBDgjK7y7TUQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Thu, Oct 27, 2016 at 10:03:14AM +0900, Eric Jeong wrote:
> 
> From: Eric Jeong <eric.jeong.opensource-WBD+wuPFNBhBDgjK7y7TUQ@public.gmane.org>
> 
> The change is to move pv88080 binding document 
> from the regulator directory to mfd binding directory
> for PV88080 PMIC MFD support.
> 
> 
> Signed-off-by: Eric Jeong <eric.jeong.opensource-WBD+wuPFNBhBDgjK7y7TUQ@public.gmane.org>
> 
> ---
> This patch applies against linux-next and next-20161026
> 
> Hi,
> 
> Change since PATCH V1
>  - Patch separated from PATCH V1
> 
> Regards,
> Eric Jeong, Dialog Semiconductor Ltd.
> 
> 
>  Documentation/devicetree/bindings/mfd/pv88080.txt  |   63 ++++++++++++++++++++
>  .../devicetree/bindings/regulator/pv88080.txt      |   62 -------------------
>  2 files changed, 63 insertions(+), 62 deletions(-)
>  create mode 100644 Documentation/devicetree/bindings/mfd/pv88080.txt
>  delete mode 100644 Documentation/devicetree/bindings/regulator/pv88080.txt

Please resend using git-format-patch -M option.

Rob
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
