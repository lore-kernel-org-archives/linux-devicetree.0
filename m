From: "John W. Linville" <linville-2XuSBdqkA4R54TAoqtyWWQ@public.gmane.org>
Subject: Re: [PATCH v4 0/4] brcmfmac: OOB interrupt support
Date: Tue, 15 Jul 2014 16:58:41 -0400
Message-ID: <20140715205841.GG26012@tuxdriver.com>
References: <1404051421-24377-1-git-send-email-hdegoede@redhat.com>
Reply-To: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-sunxi+bncBCJ6RRU764FRBYFMS2PAKGQEFNWG3SY-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
In-Reply-To: <1404051421-24377-1-git-send-email-hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
List-Post: <http://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <http://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <http://groups.google.com/group/linux-sunxi
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
List-Subscribe: <http://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <http://groups.google.com/group/linux-sunxi/subscribe>
Content-Disposition: inline
To: Hans de Goede <hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Cc: Arend van Spriel <arend-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>, Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>, linux-wireless-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
List-Id: devicetree@vger.kernel.org

The patch "brcmfmac: Cleanup used device IDs." makes this series
not build.  Unfortunately, I already merged that one...

Would you mind rebasing/reposting this?

Sorry...

John

On Sun, Jun 29, 2014 at 04:16:57PM +0200, Hans de Goede wrote:
> Hi All,
> 
> Here is v2 of the brcmfmac: OOB interrupt support series.
> 
> Changes since v1:
> -Post as a stand alone series, rather then together with sunxi pinctrl changes,
>  etc.
> -Add a patch to fixup the names of the register addresses used in the
>  "brcmfmac: Fix OOB interrupt not working for BCM43362" patch
> -Use the new register names in:
>  "brcmfmac: Fix OOB interrupt not working for BCM43362"
> 
> Changes since v2:
> -"dt: bindings: add bindings for Broadcom bcm43xx sdio devices"
>  * changed the compatible string to brcm,bcm4329-fmac
>  * replaced the dt-bindings example with a real world example
> -"brcmfmac: Fix OOB interrupt not working for BCM43362"
>  * updated commit message with confirmation from broadcom that this is the
>    right thing to do
> 
> Regards,
> 
> Hans
> 

-- 
John W. Linville		Someday the world will need a hero, and you
linville-2XuSBdqkA4R54TAoqtyWWQ@public.gmane.org			might be all we have.  Be ready.
