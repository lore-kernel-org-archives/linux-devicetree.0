From: Ian Campbell <ijc-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>
Subject: Re: [PATCH] ARM: dts: sun6i: Add a dts file for the
 Mele A1000G quad top set box
Date: Mon, 01 Jun 2015 19:07:02 +0100
Message-ID: <1433182022.5748.281.camel@hellion.org.uk>
References: <1433170979-13725-1-git-send-email-hdegoede@redhat.com>
Reply-To: ijc-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-sunxi+bncBC4Y5F6PT4PBBTF6WKVQKGQEFJ4VZWY-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
In-Reply-To: <1433170979-13725-1-git-send-email-hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
List-Post: <http://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <http://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <http://groups.google.com/group/linux-sunxi
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
List-Subscribe: <http://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <http://groups.google.com/group/linux-sunxi/subscribe>
To: Hans de Goede <hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Cc: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Mon, 2015-06-01 at 17:02 +0200, Hans de Goede wrote:
> The Mele A1000G-quad and the Mele M9 have the same PCB, sofar we've been using
> the same dts for both models. Unfortunately this does not work for the otg
> controller, on the M9 this is routed to a micro-usb connector on the outside,
> while as on the A1000G-quad it is connected to an usb to sata bridge
> (which is not populated on the M9 pcb).
> 
> This commit adds a new dts for the Mele-A1000G-quad to allow using
> different otg controller settings on the 2 boards.

But isn't intending to actually change the otg settings, right?
