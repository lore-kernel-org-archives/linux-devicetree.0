From: Danny Milosavljevic <dannym-bxPqe3T81XXwRsdMLXbzog@public.gmane.org>
Subject: Re: Re: [PATCH 11/11] arm64: dts: add Pine64 support
Date: Tue, 9 Feb 2016 21:33:21 +0100
Message-ID: <20160209213321.7ab6beba@scratchpost.org>
References: <1454348370-3816-1-git-send-email-andre.przywara@arm.com>
	<1454348370-3816-12-git-send-email-andre.przywara@arm.com>
	<20160205090337.GB1139@lukather>
	<56B47391.1040709@arm.com>
	<CAGRGNgWTMVYExfWZceoY2UKVYq=3g6EnhYBqt9GOFk0Yh6j+4g@mail.gmail.com>
Reply-To: dannym-bxPqe3T81XXwRsdMLXbzog@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-sunxi+bncBCPKHTHNWIPBBHM25G2QKGQES3IJ7CI-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
In-Reply-To: <CAGRGNgWTMVYExfWZceoY2UKVYq=3g6EnhYBqt9GOFk0Yh6j+4g-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
List-Post: <https://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <https://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <https://groups.google.com/group/linux-sunxi
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
List-Subscribe: <https://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <https://groups.google.com/group/linux-sunxi/subscribe>
To: Julian Calaby <julian.calaby-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: andre.przywara-5wv7dgnIgG8@public.gmane.org, Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>, linux-sunxi <linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>, "Mailing List, Arm" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Catalin Marinas <catalin.marinas-5wv7dgnIgG8@public.gmane.org>, Will Deacon <will.deacon-5wv7dgnIgG8@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, devicetree <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hi,

On Mon, 8 Feb 2016 11:55:43 +1100
Julian Calaby <julian.calaby-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:

> I believe that device tree overlays are the generally recommended method.

I agree. But last time I tried, the device tree compiler didn't 
support overlays - neither in Debian nor in the in-kernel dtc ("-@" is 
unsupported; last tried with linux-4.3-rc7). 

And even if you could compile them, the platform has to support specifying which 
overlays to use in the first place (for example as a Linux cmdline option). 

For example Beaglebone Black (TI Sitara) does. I don't know whether sunxi does.

Also, the overlay dts files are very different from normal dts files, see 
<http://www.patternagents.com/news/2015/01/29/devicetree-overlays.html>.

The original Linux device tree changeset patchset also introduced an in-kernel 
interface for loading/unloading of DT overlays at runtime. AFAIK, this is still 
not available to user space.

More info at <https://lwn.net/Articles/616859/>.

(I tried some 4 months ago - it wasn't integrated enough. 
 So now I just patch the main dts every time - which I probably shouldn't)

Regards,
   Danny
