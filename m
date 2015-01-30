From: Stephen Boyd <sboyd-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
Subject: Re: [Patch v2 1/6] soc: qcom: gsbi: Add support for ADM CRCI muxing
Date: Fri, 30 Jan 2015 13:37:50 -0800
Message-ID: <54CBF9AE.6060902@codeaurora.org>
References: <1422599135-5588-1-git-send-email-agross@codeaurora.org> <1422599135-5588-2-git-send-email-agross@codeaurora.org> <B36DEAB1-2D89-4B6B-991E-C2EDBEB684D9@codeaurora.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <B36DEAB1-2D89-4B6B-991E-C2EDBEB684D9-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Andy Gross <agross-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
Cc: linux-arm-msm <linux-arm-msm-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, "open list:OPEN FIRMWARE AND..." <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Bjorn Andersson <bjorn.andersson-/MT0OVThwyLZJqsBc5GL+g@public.gmane.org>, linux-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

On 01/30/15 08:32, Kumar Gala wrote:
> On Jan 30, 2015, at 12:25 AM, Andy Gross <agross-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org> wrot=
e:
>
>> Required properties if child node exists:
>> - #address-cells: Must be 1
>> - #size-cells: Must be 1
>> - ranges: Must be present
>>
>> +Note: Each GSBI should have an alias correctly numbered in "aliases=
" node.
>> +
>> Properties for children:
>>
>> A GSBI controller node can contain 0 or more child nodes representin=
g serial
>> @@ -37,6 +41,10 @@ Example for APQ8064:
>>
>> #include <dt-bindings/soc/qcom,gsbi.h>
>>
>> +	aliases {
>> +		gsbi4 =3D <&gsbi4>;
>> +	};
> You appear to be using the alias name to determine a index number for=
 the gsbi, if that is the case, than you should probably just add a cel=
l-index node to the gsbi=92s for this purpose.
>

I thought cell-index was "deprecated" and referred more to things like
enumerating all the devices on a bus by assigning them a unique ID.
Aliases, on the other hand, allow us to enumerate a subset of devices
that share the same bus with other devices of different types. For
example, how would I know that a device is gsbi1 vs serial1 if they bot=
h
used cell-index and they both had the same parent node?

--=20
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
a Linux Foundation Collaborative Project

--
To unsubscribe from this list: send the line "unsubscribe devicetree" i=
n
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
