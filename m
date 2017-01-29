From: Bhaskar U <bhaskar.upadhaya-3arQi8VN3Tc@public.gmane.org>
Subject: RE: [PATCH 1/3] Documentation: DT: Add entry for FSL LS1012A RDB,
 FRDM, QDS boards
Date: Sun, 29 Jan 2017 20:06:34 +0000
Message-ID: <VI1PR0401MB26693032D0E1283C89F8F5218C480@VI1PR0401MB2669.eurprd04.prod.outlook.com>
References: <1478714651-12679-1-git-send-email-harninder.rai@nxp.com>
 <20170129021039.GA11950@dragon>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20170129021039.GA11950@dragon>
Content-Language: en-US
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Shawn Guo <shawnguo-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Harninder Rai <harninder.rai-3arQi8VN3Tc@public.gmane.org>
Cc: "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org" <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, "mark.rutland-5wv7dgnIgG8@public.gmane.org" <mark.rutland-5wv7dgnIgG8@public.gmane.org>, "oss-fOR+EgIDQEHk1uMJSBkQmQ@public.gmane.org" <oss-fOR+EgIDQEHk1uMJSBkQmQ@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Thanks Shawn,

Regards
Bhaskar

>-----Original Message-----
>From: Shawn Guo [mailto:shawnguo-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org]
>Sent: Sunday, January 29, 2017 7:41 AM
>To: Harninder Rai <harninder.rai-3arQi8VN3Tc@public.gmane.org>
>Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org; robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org; mark.rutland-5wv7dgnIgG8@public.gmane.org;
>oss-fOR+EgIDQEHk1uMJSBkQmQ@public.gmane.org; Bhaskar U <bhaskar.upadhaya-3arQi8VN3Tc@public.gmane.org>; linux-arm-
>kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
>Subject: Re: [PATCH 1/3] Documentation: DT: Add entry for FSL LS1012A RDB,
>FRDM, QDS boards
>
>On Wed, Nov 09, 2016 at 11:34:11PM +0530, Harninder Rai wrote:
>> Signed-off-by: Harninder Rai <harninder.rai-3arQi8VN3Tc@public.gmane.org>
>> Signed-off-by: Bhaskar Upadhaya <Bhaskar.Upadhaya-3arQi8VN3Tc@public.gmane.org>
>
>Applied all 3, thanks.
>
>> ---
>>  Documentation/devicetree/bindings/arm/fsl.txt | 16 ++++++++++++++++
>>  1 file changed, 16 insertions(+)
>>
>> diff --git a/Documentation/devicetree/bindings/arm/fsl.txt
>b/Documentation/devicetree/bindings/arm/fsl.txt
>> index d6ee9c6..3b01338 100644
>> --- a/Documentation/devicetree/bindings/arm/fsl.txt
>> +++ b/Documentation/devicetree/bindings/arm/fsl.txt
>> @@ -139,6 +139,22 @@ Example:
>>  Freescale ARMv8 based Layerscape SoC family Device Tree Bindings
>>  ----------------------------------------------------------------
>>
>> +LS1012A SoC
>> +Required root node properties:
>> +    - compatible =3D "fsl,ls1012a";
>> +
>> +LS1012A ARMv8 based RDB Board
>> +Required root node properties:
>> +    - compatible =3D "fsl,ls1012a-rdb", "fsl,ls1012a";
>> +
>> +LS1012A ARMv8 based FRDM Board
>> +Required root node properties:
>> +    - compatible =3D "fsl,ls1012a-frdm", "fsl,ls1012a";
>> +
>> +LS1012A ARMv8 based QDS Board
>> +Required root node properties:
>> +    - compatible =3D "fsl,ls1012a-qds", "fsl,ls1012a";
>> +
>>  LS1043A SoC
>>  Required root node properties:
>>      - compatible =3D "fsl,ls1043a";
>> --
>> 2.7.4
>>
>>
>> _______________________________________________
>> linux-arm-kernel mailing list
>> linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
>> http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
