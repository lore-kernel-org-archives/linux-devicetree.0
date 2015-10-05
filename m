From: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Subject: Re: [PATCH 0/3] ARM: dts: sun4i: USB DRC and
 voltage-scaling for pcDuino1/2
Date: Mon, 5 Oct 2015 14:38:48 +0200
Message-ID: <20151005123848.GL2696@lukather>
References: <1443985128-23137-1-git-send-email-siarhei.siamashka@gmail.com>
Reply-To: maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="ZG5hGh9V5E9QzVHS"
Return-path: <linux-sunxi+bncBD2ZNBF5VYJRBY66ZGYAKGQEXIWZAVY-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1443985128-23137-1-git-send-email-siarhei.siamashka-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-Post: <http://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <http://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <http://groups.google.com/group/linux-sunxi
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
List-Subscribe: <http://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <http://groups.google.com/group/linux-sunxi/subscribe>
To: Siarhei Siamashka <siarhei.siamashka-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org, Zoltan HERPAI <wigyori-1V5s5g7wVVk@public.gmane.org>
List-Id: devicetree@vger.kernel.org

--ZG5hGh9V5E9QzVHS
Content-Type: text/plain; charset=UTF-8
Content-Disposition: inline

Hi,

On Sun, Oct 04, 2015 at 09:58:45PM +0300, Siarhei Siamashka wrote:
> Hello,
> 
> This brings LinkSprite pcDuino1/2 boards up to date with the latest
> kernel features. And the first patch in this set is a bugfix for the
> PH3/PH6 pins misuse.
> 
> There is currently a single dts file for pcDuino1 and pcDuino2 boards.
> They obviously had been designed to be compatible with each other, but
> have some minor differences, as can be seen when comparing schematics:
>     https://s3.amazonaws.com/pcduino/Hardware/PC+Duino_V01-20130128.pdf
>     https://s3.amazonaws.com/pcduino/Hardware/v2/pcDuino_v2_sch.pdf

Usually, the way we handle this is simply by including just the other
DT that will only hold those differences.

What are those differences exactly ?

Thanks,
Maxime

-- 
Maxime Ripard, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
--ZG5hGh9V5E9QzVHS--
