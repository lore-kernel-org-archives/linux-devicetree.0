From: Baolin Wang <baolin.wang@linaro.org>
Subject: Re: [PATCH 2/2] dma: Add Spreadtrum DMA controller driver
Date: Tue, 25 Jul 2017 14:28:39 +0800
Message-ID: <CAMz4kuJVDgsoChmCHZ_P0AMfZXmtNHj6nfzbMdkXauk2GA-vqQ@mail.gmail.com>
References: <63f2b93b3e484862f736e37d6d422b5566637163.1500361078.git.baolin.wang@spreadtrum.com>
 <4331ea088a26f515fe1f1912c568bfd07d539e9d.1500361078.git.baolin.wang@spreadtrum.com>
 <20170722075730.GU3053@localhost> <20170724064600.GB22149@spreadtrum.com> <20170725033856.GV3053@localhost>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20170725033856.GV3053@localhost>
Sender: linux-kernel-owner@vger.kernel.org
To: Vinod Koul <vinod.koul@intel.com>
Cc: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Dan Williams <dan.j.williams@intel.com>, dmaengine@vger.kernel.org, devicetree@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>, Mark Brown <broonie@kernel.org>
List-Id: devicetree@vger.kernel.org

Hi,

On 25 July 2017 at 11:38, Vinod Koul <vinod.koul@intel.com> wrote:
> On Mon, Jul 24, 2017 at 02:46:00PM +0800, Baolin Wang wrote:
>> Hi,
>>
>> On =E5=85=AD,  7=E6=9C=88 22, 2017 at 01:27:31=E4=B8=8B=E5=8D=88 +0530, =
Vinod Koul wrote:
>> > On Tue, Jul 18, 2017 at 03:06:12PM +0800, Baolin Wang wrote:
>
>> > > +static void sprd_dma_set_uid(struct sprd_dma_chn *mchan)
>> > > +{
>> > > + struct sprd_dma_dev *sdev =3D to_sprd_dma_dev(&mchan->chan);
>> > > + u32 dev_id =3D mchan->dev_id;
>> > > +
>> > > + if (dev_id !=3D DMA_SOFTWARE_UID)
>> >
>> > Whats a UID?
>>
>> It is for users, every user was assigned one unique hardware ID.
>> Then the user can trigger the DMA to transfer by the user ID.
>
> sounds like a slave id to me (hint read again struct dma_slave_config)

Yes.

>
>> > > + u32 fragmens_len;
>> > > + u32 block_len;
>> >
>> > oh please, I think I will stop here now :(
>> >
>> > > + u32 transcation_len;
>> > > + u32 src_step;
>> > > + u32 des_step;
>> > > + u32 src_frag_step;
>> > > + u32 dst_frag_step;
>> > > + u32 src_blk_step;
>> > > + u32 dst_blk_step;
>> > > + u32 wrap_ptr;
>> > > + u32 wrap_to;
>> > > + u32 dev_id;
>> > > + enum dma_end_type is_end;
>> >
>> > Looking at this I think these are overkill, many of them can be handle=
d
>> > properly by current dmaengine interfaces, so please use those before y=
ou
>> > invent your own...
>> >
>> > Also the code is bloated because you don't use virt-dma, pls use that.=
 I
>> > skipped many parts of the driver as I feel driver needs more work.
>>
>> OK. I will check the virt-dma. Thanks for your commnets.
>
> Ok, but the bigger concern is that people have defined generic interfaces
> for everyone to use, so you should also use them, the hw doesn't seem
> anything special which cannot be accommodated in the current fwk, if not =
do
> tell me which parts don't fit before you invent your own interfaces...

OK. I think I missed something and I will check the generic interfaces
again. Thanks for your help.

--=20
Baolin.wang
Best Regards
