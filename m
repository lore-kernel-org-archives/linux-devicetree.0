From: Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>
Subject: Re: [PATCH v4 5/5] fsl-diu-fb: Support setting display mode using EDID
Date: Thu, 16 Dec 2010 09:53:55 -0700
Message-ID: <AANLkTi=NwY_gcBXeKXeGX-qist3tMQ4EWqj3twYGfeWD@mail.gmail.com>
References: <1279893639-24333-1-git-send-email-agust@denx.de>
	<1279893639-24333-6-git-send-email-agust@denx.de>
	<AANLkTin-TL5_TKnyHYtZdixosfqpkPNoarSTC+K4tTUb@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <AANLkTin-TL5_TKnyHYtZdixosfqpkPNoarSTC+K4tTUb-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
To: Timur Tabi <timur-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
Cc: linuxppc-dev-mnsaURCQ41sdnm+yROfE0A@public.gmane.org, linux-fbdev-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Thu, Dec 16, 2010 at 9:47 AM, Timur Tabi <timur-KZfg59tc24xl57MIdRCFDg@public.gmane.org> wrote:
> On Fri, Jul 23, 2010 at 9:00 AM, Anatolij Gustschin <agust-ynQEQJNshbs@public.gmane.org> wrote:
>> Adds support for encoding display mode information
>> in the device tree using verbatim EDID block.
>>
>> If the EDID entry in the DIU node is present, the
>> driver will build mode database using EDID data
>> and allow setting the display modes from this database.
>> Otherwise display mode will be set using mode
>> entries from driver's internal database as usual.
>>
>> This patch also updates device tree bindings.
>>
>> Signed-off-by: Anatolij Gustschin <agust-ynQEQJNshbs@public.gmane.org>
>> Acked-by: Timur Tabi <timur-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
>> Cc: devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
>
> Anatolij,
>
> I know this patch is old, but I'm now getting back to working on the
> DIU driver. =A0One question I have: why are you reading the EDID data
> from the device tree? =A0Why not just read it directly from the device
> using I2C? =A0Who is supposed to put the EDID data into the device tree
> in the first place?

This is for devices which don't have an i2c edid channel.

g.
