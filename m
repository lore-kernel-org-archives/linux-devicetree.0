From: Sebastian Hesselbarth <sebastian.hesselbarth-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH RESEND 0/2] arm: dts: berlin: use stdout-path
Date: Sun, 20 Sep 2015 20:09:30 +0200
Message-ID: <55FEF65A.4090506@gmail.com>
References: <1442212933-760-1-git-send-email-jszhang@marvell.com>
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1442212933-760-1-git-send-email-jszhang-eYqpPyKDWXRBDgjK7y7TUQ@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Jisheng Zhang <jszhang-eYqpPyKDWXRBDgjK7y7TUQ@public.gmane.org>, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, pawel.moll-5wv7dgnIgG8@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org, galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org, linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org
Cc: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

On 14.09.2015 08:42, Jisheng Zhang wrote:
> These two simple patches use stdout-path to specify the console.
> The first patch add aliases for serial uarts. The second patch
> removes the console argument from the command line, uses stdout-path
> instead.
>
> Jisheng Zhang (2):
>    arm: dts: berlin: add aliases for serial
>    arm: dts: berlin: use stdout-path

Applied to berlin/dt.

Thanks,
   Sebastian

>   arch/arm/boot/dts/berlin2-sony-nsz-gs7.dts        | 3 ++-
>   arch/arm/boot/dts/berlin2.dtsi                    | 6 ++++++
>   arch/arm/boot/dts/berlin2cd-google-chromecast.dts | 3 ++-
>   arch/arm/boot/dts/berlin2cd.dtsi                  | 5 +++++
>   arch/arm/boot/dts/berlin2q-marvell-dmp.dts        | 3 ++-
>   arch/arm/boot/dts/berlin2q.dtsi                   | 5 +++++
>   6 files changed, 22 insertions(+), 3 deletions(-)
>

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
