From: Gregory CLEMENT <gregory.clement-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Subject: Re: [PATCH v3 1/5] rtc: armada38x: Add the device tree binding documentation
Date: Thu, 15 Jan 2015 15:34:25 +0100
Message-ID: <54B7CFF1.8080703@free-electrons.com>
References: <1421318826-27268-1-git-send-email-gregory.clement@free-electrons.com> <1421318826-27268-2-git-send-email-gregory.clement@free-electrons.com> <20150115113947.GC16217@leverpostej>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20150115113947.GC16217@leverpostej>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>
Cc: Alessandro Zummo <a.zummo-BfzFCNDTiLLj+vYz1yj4TQ@public.gmane.org>, "rtc-linux-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org" <rtc-linux-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>, Jason Cooper <jason-NLaQJdtUoK4Be96aLqz0jA@public.gmane.org>, Andrew Lunn <andrew-g2DYL2Zd6BY@public.gmane.org>, Sebastian Hesselbarth <sebastian.hesselbarth-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Arnaud Ebalard <arno-LkuqDEemtHBg9hUCZPvPmw@public.gmane.org>, Thomas Petazzoni <thomas.petazzoni-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Ezequiel Garcia <ezequiel.garcia-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Boris BREZILLON <boris.brezillon-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Lior Amsalem <alior-eYqpPyKDWXRBDgjK7y7TUQ@public.gmane.org>, Tawfik Bayouk <tawfik-eYqpPyKDWXRBDgjK7y7TUQ@public.gmane.org>, Nadav Haklai <nadavh-eYqpPyKDWXRBDgjK7y7TUQ@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On 15/01/2015 12:39, Mark Rutland wrote:
> On Thu, Jan 15, 2015 at 10:47:02AM +0000, Gregory CLEMENT wrote:
>> The Armada 38x SoCs come with a new RTC which differs from the one
>> used in the other mvebu SoCs until now. This patch describes the
>> binding of this RTC.
>>
>> Signed-off-by: Gregory CLEMENT <gregory.clement-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
>> ---
>>  .../devicetree/bindings/rtc/armada-380-rtc.txt     | 22 +++++++++++=
+++++++++++
>>  1 file changed, 22 insertions(+)
>>  create mode 100644 Documentation/devicetree/bindings/rtc/armada-380=
-rtc.txt
>>
>> diff --git a/Documentation/devicetree/bindings/rtc/armada-380-rtc.tx=
t b/Documentation/devicetree/bindings/rtc/armada-380-rtc.txt
>> new file mode 100644
>> index 000000000000..e6fe29bda608
>> --- /dev/null
>> +++ b/Documentation/devicetree/bindings/rtc/armada-380-rtc.txt
>> @@ -0,0 +1,22 @@
>> +* Real Time Clock of the Armada 38x SoCs
>> +
>> +RTC controller for the Armada 38x SoCs
>> +
>> +Required properties:
>> +- compatible : Should be "marvell,armada-380-rtc"
>> +- reg: physical base address of the controller and length of memory
>> +  mapped region, associated to the reg-name "rtc". The other entry =
is
>> +  related to the interrupt control from the SoC, associated to the
>> +  reg-name "soc-int".
>> +- reg-names: names of the mapped memory regions listed in reg prope=
rty
>> +    in the same order: "rtc" and "soc-int".
>=20
> It would be nicer if reg were defined in terms of reg-names to avoid
> redundancy, e.g.
>=20
> - reg: a list of base address and size pairs, one for each entry in
>   reg-names
> - reg names: should contain:
>   * "rtc" for the RTC registers
>   * "soc-int" for the interrutp control registers.

OK

>=20
> That said, what are the "soc-int" registers, and why does the RTC dri=
ver
> need to poke them? It looks like they're for a separate component (i.=
e.
> the interrupt controller).

I don't have much information about it but for sure it is not part of t=
he
interrupt controller. It is a range of 3 registers related to the RTC, =
2
of them are not documented and the third one is related to the interrup=
t
management of the RTC. That's why I named this range soc-int(errupt), b=
ut
it would more accurate to name it rtc-soc

Gr=E9gory

--=20
Gregory Clement, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
--
To unsubscribe from this list: send the line "unsubscribe devicetree" i=
n
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
