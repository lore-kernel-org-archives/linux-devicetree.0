From: Wojciech Baranowski <baranowski@google.com>
Subject: Re: [PATCH] of/platform: Allow missing address for dev name lookup
Date: Fri, 18 Nov 2011 11:45:00 -0500
Message-ID: <CAC0oEedK1E4K9mSS_pOKz_xvHtXy576kCe9oG+D3aHz14tW=WA@mail.gmail.com>
References: <1321628948.21392.37.camel@zalecze.wat.corp.google.com>
	<4EC6838F.8020705@calxeda.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <4EC6838F.8020705@calxeda.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Rob Herring <rob.herring@calxeda.com>
Cc: devicetree-discuss@lists.ozlabs.org, Grant Likely <grant.likely@secretlab.ca>, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Fri, Nov 18, 2011 at 11:10 AM, Rob Herring <rob.herring@calxeda.com>=
 wrote:
> On 11/18/2011 09:09 AM, Wojciech Baranowski wrote:
>> While looking up linux name for platform device, check the address o=
nly if it
>> has been supplied in lookup table.
>>
> And the reason you want to do this is?

Name lookup table is used to provide names for platform devices on the
board I'm working on. I'm adding /sound node without address for audio
subsystem and don't want to break that convention.

>> Signed-off-by: Wojciech Baranowski <baranowski@chromium.org>
>> ---
>> =A0drivers/of/platform.c | =A0 =A08 +++++---
>> =A01 files changed, 5 insertions(+), 3 deletions(-)
>>
>> diff --git a/drivers/of/platform.c b/drivers/of/platform.c
>> index cbd5d70..94763c0 100644
>> --- a/drivers/of/platform.c
>> +++ b/drivers/of/platform.c
>> @@ -314,12 +314,14 @@ static const struct of_dev_auxdata *of_dev_loo=
kup(const struct of_dev_auxdata *l
>> =A0 =A0 =A0 if (!lookup)
>> =A0 =A0 =A0 =A0 =A0 =A0 =A0 return NULL;
>>
>> - =A0 =A0 for(; lookup->name !=3D NULL; lookup++) {
>> + =A0 =A0 for (; lookup->name !=3D NULL; lookup++) {
>> =A0 =A0 =A0 =A0 =A0 =A0 =A0 if (!of_device_is_compatible(np, lookup-=
>compatible))
>> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 continue;
>> - =A0 =A0 =A0 =A0 =A0 =A0 if (of_address_to_resource(np, 0, &res))
>> + =A0 =A0 =A0 =A0 =A0 =A0 if (lookup->phys_addr &&
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 of_address=
_to_resource(np, 0, &res))
>> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 continue;
>> - =A0 =A0 =A0 =A0 =A0 =A0 if (res.start !=3D lookup->phys_addr)
>> + =A0 =A0 =A0 =A0 =A0 =A0 if (lookup->phys_addr &&
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 res.start =
!=3D lookup->phys_addr)
>> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 continue;
>> =A0 =A0 =A0 =A0 =A0 =A0 =A0 pr_debug("%s: devname=3D%s\n", np->full_=
name, lookup->name);
>> =A0 =A0 =A0 =A0 =A0 =A0 =A0 return lookup;
>
>
