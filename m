From: =?ISO-8859-1?Q?Marc_Mar=ED?= <marc.mari.barcelo-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: Device Tree Generator
Date: Mon, 10 Mar 2014 14:26:51 +0100
Message-ID: <CA+nFU8Tx=hp686EhcP3u=wqQN=kL7PBJLy7DNcFu55T_Lp7OdA@mail.gmail.com>
References: <CA+nFU8SUbmwmUN1SWVoh2VEEQ-r347v=GMfDJmAbMhn_yLQCRA@mail.gmail.com>
 <531D91CD.2010300@monstr.eu> <531DBD81.40201@home.nl>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <531DBD81.40201-CmkmPbn3yAE@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Walter Goossens <waltergoossens-CmkmPbn3yAE@public.gmane.org>
Cc: monstr-pSz03upnqPeHXe+LvDLADg@public.gmane.org, devicetree <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

As far as I know, when you add extensions to the board, the device
tree has to be changed. They already developed a dynamic device tree
updater, but it has to be changed manually.

But, I already decided to do another project for which I'm more qualifi=
ed.

Regards
Marc

2014-03-10 14:26 GMT+01:00 Walter Goossens <waltergoossens-CmkmPbn3yAE@public.gmane.org>:
> On 03/10/14 11:19, Michal Simek wrote:
>> On 03/07/2014 07:57 PM, Marc Mar=ED wrote:
>>> Hello everyone
>>>
>>> In the context of Google Summer of Code project, I'm thinking to wo=
rk
>>> on a device-tree generator, starting at the Beagleboard platform.
>>>
>>> To define better the scope of this project, so it can be useful too
>>> outside this specific platform, I would like to ask for your opinio=
ns
>>> in necessary and good-to-have features.
>> FYI: Xilinx have device-tree generator which extract information
>> from design tools.
>>
>> Thanks,
>> Michal
>>
>
> And so does Altera ;)
> I think it makes sense for reprogrammable devices (such as FPGA's) bu=
t
> I'm not quite sure why you'd need a devicetree generator for a fairly
> static board.
>
> Walter
>
>
--
To unsubscribe from this list: send the line "unsubscribe devicetree" i=
n
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
