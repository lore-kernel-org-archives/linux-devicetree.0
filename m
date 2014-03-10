From: Walter Goossens <waltergoossens-CmkmPbn3yAE@public.gmane.org>
Subject: Re: Device Tree Generator
Date: Mon, 10 Mar 2014 14:26:25 +0100
Message-ID: <531DBD81.40201@home.nl>
References: <CA+nFU8SUbmwmUN1SWVoh2VEEQ-r347v=GMfDJmAbMhn_yLQCRA@mail.gmail.com> <531D91CD.2010300@monstr.eu>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <531D91CD.2010300-pSz03upnqPeHXe+LvDLADg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: monstr-pSz03upnqPeHXe+LvDLADg@public.gmane.org, =?ISO-8859-1?Q?Marc_Mar=ED?= <marc.mari.barcelo-Iylbf7zvluZi+jfwTKn9+w@public.gmane.org>
Cc: devicetree <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On 03/10/14 11:19, Michal Simek wrote:
> On 03/07/2014 07:57 PM, Marc Mar=ED wrote:
>> Hello everyone
>>
>> In the context of Google Summer of Code project, I'm thinking to wor=
k
>> on a device-tree generator, starting at the Beagleboard platform.
>>
>> To define better the scope of this project, so it can be useful too
>> outside this specific platform, I would like to ask for your opinion=
s
>> in necessary and good-to-have features.
> FYI: Xilinx have device-tree generator which extract information
> from design tools.
>
> Thanks,
> Michal
>

And so does Altera ;)
I think it makes sense for reprogrammable devices (such as FPGA's) but
I'm not quite sure why you'd need a devicetree generator for a fairly
static board.

Walter


--
To unsubscribe from this list: send the line "unsubscribe devicetree" i=
n
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
