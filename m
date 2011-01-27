From: Grant Likely <grant.likely@secretlab.ca>
Subject: Re: [RFC,1/5] arm/dt: Add dt machine definition
Date: Wed, 26 Jan 2011 20:31:27 -0700
Message-ID: <AANLkTimssaeQUmvM5BTot23R-hR2PNg3D_barQsGVywi@mail.gmail.com>
References: <20110126044406.16410.22096.stgit@localhost6.localdomain6> <lkml-patchwork-507601-use-section@mdm.bga.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <lkml-patchwork-507601-use-section@mdm.bga.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Milton Miller <miltonm@bga.com>
Cc: devicetree-discuss@lists.ozlabs.org, jeremy.kerr@canonical.com, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.orga, nicolas.pitre@linaro.org
List-Id: devicetree@vger.kernel.org

On Wed, Jan 26, 2011 at 11:27 AM, Milton Miller <miltonm@bga.com> wrote=
:
> On Wed, 26 Jan 2011 about 04:44:06 -0000, Grant Likely wrote:
>>
>> Signed-off-by: Grant Likely <grant.likely@secretlab.ca>
>
> needs a description ...

oops

>>
>> ---
>> arch/arm/include/asm/mach/arch.h | =A0 =A09 +++++++++
>> =A01 files changed, 9 insertions(+), 0 deletions(-)
>>
>>
>>
>> +#define MACH_TYPE_DT 0xffffffff
>> +
>> +#define DT_MACHINE_START(_name, _namestr) =A0 =A0 =A0 =A0 =A0 =A0\
>> +static const struct machine_desc __mach_desc_##_name \
>> + __used =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0\
>> + __attribute__((__section__(".arch.info.init"))) =3D { \
>
> linux/compiler.h defines __section for this

=46or commonality, I duplicated what was already done for #define
MACHINE_START in this same file.  However, I'm not even entirely sure
that I'm going to keep this hunk around.  With some of the recent
changes to the arm-dt patches, a special DT machine id of 0xffffffff
is no longer needed.  This patch may get dropped in a future posting
of this series.

g.

>
>> + =A0 =A0 .nr =A0 =A0 =A0 =A0 =A0 =A0 =3D MACH_TYPE_DT, =A0 =A0 =A0 =
=A0 =A0 =A0 =A0 =A0 \
>> + =A0 =A0 .name =A0 =A0 =A0 =A0 =A0 =3D _namestr,
>> +
>> =A0#endif
>
> milton
>



--=20
Grant Likely, B.Sc., P.Eng.
Secret Lab Technologies Ltd.
