From: Heiko Stuebner <heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org>
Subject: Re: [PATCH 2/2] ARM: dts: rockchip: correct regulator PM properties
Date: Wed, 19 Aug 2015 08:19:47 +0200
Message-ID: <10828643.SSUS2EOuvv@phil>
References: <1439923455-109818-1-git-send-email-briannorris@chromium.org> <20150818224831.GA140911@google.com> <20150818232806.GC140911@google.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20150818232806.GC140911-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Brian Norris <briannorris-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Cc: linux-rockchip-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Brian Norris <computersforpeace-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Alexandru M Stan <amstan-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, Douglas Anderson <dianders-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Am Dienstag, 18. August 2015, 16:28:06 schrieb Brian Norris:
> Now that I'm looking a little closer, it seems like other existing DTS's
> are broken too, then. Jerry looks like it was converted to the
> regulator-state-mem node binding, but the conversion doesn't seem to
> make sense when I compare the chromium DTS sources with the for-next
> source I see in your tree.
> 
> In -next:
> 
>      regulators {
>              mic_vcc: LDO_REG2 {
>                         regulator-name = "mic_vcc";
>                         regulator-always-on;
>                         regulator-boot-on;
>                         regulator-min-microvolt = <1800000>;
>                         regulator-max-microvolt = <1800000>;
>                         regulator-state-mem {
>                                 regulator-on-in-suspend;
>                         };
>                 };
>          };
> 
> But chromium had:
> 
>        regulators {
>                 mic_vcc: LDO_REG2 {
>                         regulator-always-on;
>                         regulator-boot-on;
>                         regulator-min-microvolt = <1800000>;
>                         regulator-max-microvolt = <1800000>;
>                         regulator-name = "mic_vcc";
>                         regulator-suspend-mem-disabled;
>                 };
>        };
> 
> So I guess I'll make the proper conversion for all the veyron variants I
> see.

great, just take into account the deep vs. shallow suspend modes :-)

The original regulator-state changes did happen when we had this suspend 
instability (counter and gpioint stuff) and I did go with the values similar to 
the rk3288-evb, as this was the only one resuming at all at the time. So I 
guess I never looked to closesly what it did, as long as the system came out 
of suspend sucessfully again :-)


Heiko
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
