From: Fabio Estevam <festevam-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH] dt-bindings: mfd: mc13xxx: Add the unit address to sysled
Date: Mon, 4 Dec 2017 07:09:49 -0200
Message-ID: <CAOMZO5BQM=ELmky-gJvHgvZ55_gop32Y4P6YmY9Au5hXqrw+vQ@mail.gmail.com>
References: <1512165086-25512-1-git-send-email-festevam@gmail.com> <20171204090721.tgffux64kv3hecaq@dell>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20171204090721.tgffux64kv3hecaq@dell>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Lee Jones <lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Cc: "robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org" <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Fabio Estevam <fabio.estevam-3arQi8VN3Tc@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Mon, Dec 4, 2017 at 7:07 AM, Lee Jones <lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org> wrote:
> On Fri, 01 Dec 2017, Fabio Estevam wrote:
>
>> From: Fabio Estevam <fabio.estevam-3arQi8VN3Tc@public.gmane.org>
>>
>> As the 'reg' property is mandatory in the subnodes, improve the
>> example by adding the unit address to the sysled node.
>>
>> This prevents the following build warning with W=1:
>>
>> Node /soc/aips@70000000/spba@70000000/ecspi@70010000/pmic@0/leds/sysled0 has a reg or ranges property, but no unit name
>>
>> Signed-off-by: Fabio Estevam <fabio.estevam-3arQi8VN3Tc@public.gmane.org>
>> ---
>>  Documentation/devicetree/bindings/mfd/mc13xxx.txt | 2 +-
>>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> Why do I have 2 identical patches in my inbox?

There was a typo in the mailing list address in the first one, sorry.
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
