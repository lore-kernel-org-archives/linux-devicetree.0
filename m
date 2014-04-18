From: John Crispin <john-Pj+rj9U5foFAfugRpC6u6w@public.gmane.org>
Subject: Re: [PATCH 2/3] mips: dts: add device_type="memory" where missing
Date: Fri, 18 Apr 2014 19:16:34 +0200
Message-ID: <53515DF2.8060106@phrozen.org>
References: <1397756521-29387-1-git-send-email-leif.lindholm@linaro.org> <1397756521-29387-3-git-send-email-leif.lindholm@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1397756521-29387-3-git-send-email-leif.lindholm-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Leif Lindholm <leif.lindholm-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: patches-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, linux-mips-6z/3iImG2C8G8FEW9MqTrA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, John Crispin <blogic-p3rKhJxN3npAfugRpC6u6w@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>
List-Id: devicetree@vger.kernel.org



On 17/04/2014 19:42, Leif Lindholm wrote:
> A few platforms lack a 'device_type = "memory"' for their memory 
> nodes, relying on an old ppc quirk in order to discover its
> memory. Add this, to permit that quirk to be made ppc only.
> 
> Signed-off-by: Leif Lindholm <leif.lindholm-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org> Cc:
> linux-mips-6z/3iImG2C8G8FEW9MqTrA@public.gmane.org Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org Cc: John
> Crispin <blogic-p3rKhJxN3npAfugRpC6u6w@public.gmane.org> Cc: Mark Rutland
> <mark.rutland-5wv7dgnIgG8@public.gmane.org>

Acked-by: John Crispin <blogic-p3rKhJxN3npAfugRpC6u6w@public.gmane.org?


Thanks for the cleanup ....


> --- arch/mips/lantiq/dts/easy50712.dts    |    1 + 
> arch/mips/ralink/dts/mt7620a_eval.dts |    1 + 
> arch/mips/ralink/dts/rt2880_eval.dts  |    1 + 
> arch/mips/ralink/dts/rt3052_eval.dts  |    1 + 
> arch/mips/ralink/dts/rt3883_eval.dts  |    1 + 5 files changed, 5
> insertions(+)
> 
> diff --git a/arch/mips/lantiq/dts/easy50712.dts
> b/arch/mips/lantiq/dts/easy50712.dts index fac1f5b..143b8a3 100644 
> --- a/arch/mips/lantiq/dts/easy50712.dts +++
> b/arch/mips/lantiq/dts/easy50712.dts @@ -8,6 +8,7 @@ };
> 
> memory@0 { +		device_type = "memory"; reg = <0x0 0x2000000>; };
> 
> diff --git a/arch/mips/ralink/dts/mt7620a_eval.dts
> b/arch/mips/ralink/dts/mt7620a_eval.dts index 35eb874..709f581
> 100644 --- a/arch/mips/ralink/dts/mt7620a_eval.dts +++
> b/arch/mips/ralink/dts/mt7620a_eval.dts @@ -7,6 +7,7 @@ model =
> "Ralink MT7620A evaluation board";
> 
> memory@0 { +		device_type = "memory"; reg = <0x0 0x2000000>; };
> 
> diff --git a/arch/mips/ralink/dts/rt2880_eval.dts
> b/arch/mips/ralink/dts/rt2880_eval.dts index 322d700..0a685db
> 100644 --- a/arch/mips/ralink/dts/rt2880_eval.dts +++
> b/arch/mips/ralink/dts/rt2880_eval.dts @@ -7,6 +7,7 @@ model =
> "Ralink RT2880 evaluation board";
> 
> memory@0 { +		device_type = "memory"; reg = <0x8000000 0x2000000>; 
> };
> 
> diff --git a/arch/mips/ralink/dts/rt3052_eval.dts
> b/arch/mips/ralink/dts/rt3052_eval.dts index 0ac73ea..ec9e9a0
> 100644 --- a/arch/mips/ralink/dts/rt3052_eval.dts +++
> b/arch/mips/ralink/dts/rt3052_eval.dts @@ -7,6 +7,7 @@ model =
> "Ralink RT3052 evaluation board";
> 
> memory@0 { +		device_type = "memory"; reg = <0x0 0x2000000>; };
> 
> diff --git a/arch/mips/ralink/dts/rt3883_eval.dts
> b/arch/mips/ralink/dts/rt3883_eval.dts index 2fa6b33..e8df21a
> 100644 --- a/arch/mips/ralink/dts/rt3883_eval.dts +++
> b/arch/mips/ralink/dts/rt3883_eval.dts @@ -7,6 +7,7 @@ model =
> "Ralink RT3883 evaluation board";
> 
> memory@0 { +		device_type = "memory"; reg = <0x0 0x2000000>; };
> 
> 
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
