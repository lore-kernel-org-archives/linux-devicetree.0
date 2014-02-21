Return-Path: <sriku.linux@gmail.com>
MIME-Version: 1.0
Sender: sriku.linux@gmail.com
In-Reply-To: <CAJe_ZheGP-9f659tOdCHEMrbh73MDi7VjoieFhdQbvjVwiEbJQ@mail.gmail.com>
References: <1392465619-27614-1-git-send-email-sthokal@xilinx.com>
	<1392465619-27614-2-git-send-email-sthokal@xilinx.com>
	<CAJe_Zhc_GNNSDWNFuk+cMHEqxfSCJB_ey=Bf+SwJK-nS=u9ceg@mail.gmail.com>
	<CA+mB=1KdZZpTmpA0Xp_c4mhgFbjRZ6urYrCwdvoTCmcugQMDUA@mail.gmail.com>
	<CAJe_ZhdOmu3k9gbPdQzPteyzwsMA8OzWHdhHnXudbF=X7JMhVQ@mail.gmail.com>
	<CA+mB=1K43MDZj0Rx3q=ETQMaFsG1j7TXsH6v-7a26JdtqTJkbw@mail.gmail.com>
	<CAJe_ZhfedP7Paf3Zq9chL0WUeLJrsy_DJL05sSbfqnfTtji=HQ@mail.gmail.com>
	<CA+mB=1LK+aVbvh741+PMnpj_mwZRvJZzR5Fh=hf72UWQvxUiVQ@mail.gmail.com>
	<CAJe_ZheGP-9f659tOdCHEMrbh73MDi7VjoieFhdQbvjVwiEbJQ@mail.gmail.com>
Date: Fri, 21 Feb 2014 20:07:30 +0530
Message-ID: <CA+mB=1KqP=KgNZ_hYGbhin5TqokA+nCRPAA4Qa2R_2OWwv4yVw@mail.gmail.com>
Subject: Re: [PATCH v3 1/3] dma: Support multiple interleaved frames with
 non-contiguous memory
From: Srikanth Thokala <sthokal@xilinx.com>
Content-Type: multipart/alternative; boundary=089e01229710d2468a04f2eb8f07
To: Jassi Brar <jaswinder.singh@linaro.org>
Cc: Srikanth Thokala <sthokal@xilinx.com>, "Williams, Dan J" <dan.j.williams@intel.com>, "Koul, Vinod" <vinod.koul@intel.com>, Michal Simek <michal.simek@xilinx.com>, Grant Likely <grant.likely@linaro.org>, Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org, Levente Kurusa <levex@linux.com>, Lars-Peter Clausen <lars@metafoo.de>, lkml <linux-kernel@vger.kernel.org>, dmaengine@vger.kernel.org, Andy Shevchenko <andriy.shevchenko@linux.intel.com>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
List-ID: <devicetree@vger.kernel.org>

--089e01229710d2468a04f2eb8f07
Content-Type: text/plain; charset=ISO-8859-1

On Thu, Feb 20, 2014 at 3:23 PM, Jassi Brar <jaswinder.singh@linaro.org>
wrote:
> On 20 February 2014 14:54, Srikanth Thokala <sthokal@xilinx.com> wrote:
>> On Wed, Feb 19, 2014 at 12:33 AM, Jassi Brar <jaswinder.singh@linaro.org>
wrote:
>>> On 18 February 2014 23:16, Srikanth Thokala <sthokal@xilinx.com> wrote:
>>>> On Tue, Feb 18, 2014 at 10:20 PM, Jassi Brar <
jaswinder.singh@linaro.org> wrote:
>>>>> On 18 February 2014 16:58, Srikanth Thokala <sthokal@xilinx.com>
wrote:
>>>>>> On Mon, Feb 17, 2014 at 3:27 PM, Jassi Brar <
jaswinder.singh@linaro.org> wrote:
>>>>>>> On 15 February 2014 17:30, Srikanth Thokala <sthokal@xilinx.com>
wrote:
>>>>>>>> The current implementation of interleaved DMA API support multiple
>>>>>>>> frames only when the memory is contiguous by incrementing
src_start/
>>>>>>>> dst_start members of interleaved template.
>>>>>>>>
>>>>>>>> But, when the memory is non-contiguous it will restrict slave
device
>>>>>>>> to not submit multiple frames in a batch.  This patch handles this
>>>>>>>> issue by allowing the slave device to send array of interleaved dma
>>>>>>>> templates each having a different memory location.
>>>>>>>>
>>>>>>> How fragmented could be memory in your case? Is it inefficient to
>>>>>>> submit separate transfers for each segment/frame?
>>>>>>> It will help if you could give a typical example (chunk size and gap
>>>>>>> in bytes) of what you worry about.
>>>>>>
>>>>>> With scatter-gather engine feature in the hardware, submitting
separate
>>>>>> transfers for each frame look inefficient. As an example, our DMA
engine
>>>>>> supports up to 16 video frames, with each frame (a typical video
frame
>>>>>> size) being contiguous in memory but frames are scattered into
different
>>>>>> locations. We could not definitely submit frame by frame as it would
be
>>>>>> software overhead (HW interrupting for each frame) resulting in
video lags.
>>>>>>
>>>>> IIUIC, it is 30fps and one dma interrupt per frame ... it doesn't seem
>>>>> inefficient at all. Even poor-latency audio would generate a higher
>>>>> interrupt-rate. So the "inefficiency concern" doesn't seem valid to
>>>>> me.
>>>>>
>>>>> Not to mean we shouldn't strive to reduce the interrupt-rate further.
>>>>> Another option is to emulate the ring-buffer scheme of ALSA.... which
>>>>> should be possible since for a session of video playback the frame
>>>>> buffers' locations wouldn't change.
>>>>>
>>>>> Yet another option is to use the full potential of the
>>>>> interleaved-xfer api as such. It seems you confuse a 'video frame'
>>>>> with the interleaved-xfer api's 'frame'. They are different.
>>>>>
>>>>> Assuming your one video frame is F bytes long and Gk is the gap in
>>>>> bytes between end of frame [k] and start of frame [k+1] and  Gi != Gj
>>>>> for i!=j
>>>>> In the context of interleaved-xfer api, you have just 1 Frame of 16
>>>>> chunks. Each chunk is Fbytes and the inter-chunk-gap(ICG) is Gk  where
>>>>> 0<=k<15
>>>>> So for your use-case .....
>>>>>   dma_interleaved_template.numf = 1   /* just 1 frame */
>>>>>   dma_interleaved_template.frame_size = 16  /* containing 16 chunks */
>>>>>    ...... //other parameters
>>>>>
>>>>> You have 3 options to choose from and all should work just as fine.
>>>>> Otherwise please state your problem in real numbers (video-frames'
>>>>> size, count & gap in bytes).
>>>>
>>>> Initially I interpreted interleaved template the same.  But, Lars
corrected me
>>>> in the subsequent discussion and let me put it here briefly,
>>>>
>>>> In the interleaved template, each frame represents a line of size
denoted by
>>>> chunk.size and the stride by icg.  'numf' represent number of frames
i.e.
>>>> number of lines.
>>>>
>>>> In video frame context,
>>>> chunk.size -> hsize
>>>> chunk.icg -> stride
>>>> numf -> vsize
>>>> and frame_size is always 1 as it will have only one chunk in a line.
>>>>
>>> But you said in your last post
>>>   "with each frame (a typical video frame size) being contiguous in
memory"
>>>  ... which is not true from what you write above. Anyways, my first 2
>>> suggestions still hold.
>>
>> Yes, each video frame is contiguous and they can be scattered.
>>
> I assume by contiguous frame you mean as in framebuffer?  Which is an
> array of bytes.
> If yes, then you should do as I suggest first,  frame_size=16  and numf=1.

I think am confusing you.  I would like to explain with an example.  Lets
say
each video frame is 4k size starting at address 0x10004000 (-0x10005000) and
other frame at 0x20002000 (-0x20003000), and so on.  So, the frames are
scattered in memory and as the template doesnt allow multiple src_start/
dst_start we could not use single template to fill the HW descriptors (of
frames).  So, I feel your suggestion might not work if the frames are
scattered.
Also, how could we get 'vsize' value in your approach?  More importantly,
we are overriding the semantics of interleaved template members.

>
> If no, then it seems you are already doing the right thing.... the
> ring-buffer scheme. Please share some stats how the current api is
> causing you overhead because that is a very common case (many
> controllers support LLI) and you have 467ms (@30fps with 16-frames
> ring-buffer) to queue in before you see any frame drop.

As I mentioned earlier in the thread, our hardware has a SG engine where by
we could send multiple frames in a batch.  Using the original implementation
of interleaved API, we have three options to transfer.

One is to send frame by frame to the hardware.  We get a async_tx desc for
each frame and then we submit it to hardware triggering it to transfer this
BD.
We queue the next descriptor on the pending queue and whenever there is
a completion interrupt we submit the next BD on this queue to hardware. In
this implementation we are not efficiently using the SG engine in the
hardware
as we transferring frame by frame even HW allows us to transfer multiple
frames.

The second option is to queue all the BDs until the maximum frames that HW
is
capable to transfer in a batch and then submit to SG engine in the HW.  With
this approach I feel there will be additional software overhead to track
the number
of maximum transfers and few additional cycles to release the cookie of
each desc.
Here, each desc represents a frame.

The last option is the current implementation of the driver along with this
change in
API.  It will allow us to send array of interleaved templates wherein we
could allocate
a single async desc which will handle multiple frames (or segments) and
just submit
this desc to HW.  Then we program the current to first frame, tail to last
frame and
HW will complete this transfer.  Here, each desc represents multiple frames.

My point here is the driver should use hardware resources efficiently and I
feel the
driver will be inefficient if we dont use them.

I request you to please go through our hardware specification to get an
overview of
implementation and provide me your suggestions.  Here is the link,
http://www.xilinx.com/support/documentation/ip_documentation/axi_vdma/v6_1/pg020_axi_vdma.pdf

Srikanth

>
> Regards,
> Jassi
> --
> To unsubscribe from this list: send the line "unsubscribe linux-kernel" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
> Please read the FAQ at  http://www.tux.org/lkml/

--089e01229710d2468a04f2eb8f07
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">On Thu, Feb 20, 2014 at 3:23 PM, Jassi Brar &lt;<a href=3D=
"mailto:jaswinder.singh@linaro.org" target=3D"_blank">jaswinder.singh@linar=
o.org</a>&gt; wrote:<br>&gt; On 20 February 2014 14:54, Srikanth Thokala &l=
t;<a href=3D"mailto:sthokal@xilinx.com" target=3D"_blank">sthokal@xilinx.co=
m</a>&gt; wrote:<br>

&gt;&gt; On Wed, Feb 19, 2014 at 12:33 AM, Jassi Brar &lt;<a href=3D"mailto=
:jaswinder.singh@linaro.org" target=3D"_blank">jaswinder.singh@linaro.org</=
a>&gt; wrote:<br>&gt;&gt;&gt; On 18 February 2014 23:16, Srikanth Thokala &=
lt;<a href=3D"mailto:sthokal@xilinx.com" target=3D"_blank">sthokal@xilinx.c=
om</a>&gt; wrote:<br>

&gt;&gt;&gt;&gt; On Tue, Feb 18, 2014 at 10:20 PM, Jassi Brar &lt;<a href=
=3D"mailto:jaswinder.singh@linaro.org" target=3D"_blank">jaswinder.singh@li=
naro.org</a>&gt; wrote:<br>&gt;&gt;&gt;&gt;&gt; On 18 February 2014 16:58, =
Srikanth Thokala &lt;<a href=3D"mailto:sthokal@xilinx.com" target=3D"_blank=
">sthokal@xilinx.com</a>&gt; wrote:<br>

&gt;&gt;&gt;&gt;&gt;&gt; On Mon, Feb 17, 2014 at 3:27 PM, Jassi Brar &lt;<a=
 href=3D"mailto:jaswinder.singh@linaro.org" target=3D"_blank">jaswinder.sin=
gh@linaro.org</a>&gt; wrote:<br>&gt;&gt;&gt;&gt;&gt;&gt;&gt; On 15 February=
 2014 17:30, Srikanth Thokala &lt;<a href=3D"mailto:sthokal@xilinx.com" tar=
get=3D"_blank">sthokal@xilinx.com</a>&gt; wrote:<br>

&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt; The current implementation of interleaved =
DMA API support multiple<br>&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt; frames only wh=
en the memory is contiguous by incrementing src_start/<br>&gt;&gt;&gt;&gt;&=
gt;&gt;&gt;&gt; dst_start members of interleaved template.<br>

&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;<br>&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt; But, w=
hen the memory is non-contiguous it will restrict slave device<br>&gt;&gt;&=
gt;&gt;&gt;&gt;&gt;&gt; to not submit multiple frames in a batch. =A0This p=
atch handles this<br>

&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt; issue by allowing the slave device to send=
 array of interleaved dma<br>&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt; templates eac=
h having a different memory location.<br>&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;<b=
r>

&gt;&gt;&gt;&gt;&gt;&gt;&gt; How fragmented could be memory in your case? I=
s it inefficient to<br>&gt;&gt;&gt;&gt;&gt;&gt;&gt; submit separate transfe=
rs for each segment/frame?<br>&gt;&gt;&gt;&gt;&gt;&gt;&gt; It will help if =
you could give a typical example (chunk size and gap<br>

&gt;&gt;&gt;&gt;&gt;&gt;&gt; in bytes) of what you worry about.<br>&gt;&gt;=
&gt;&gt;&gt;&gt;<br>&gt;&gt;&gt;&gt;&gt;&gt; With scatter-gather engine fea=
ture in the hardware, submitting separate<br>&gt;&gt;&gt;&gt;&gt;&gt; trans=
fers for each frame look inefficient. As an example, our DMA engine<br>

&gt;&gt;&gt;&gt;&gt;&gt; supports up to 16 video frames, with each frame (a=
 typical video frame<br>&gt;&gt;&gt;&gt;&gt;&gt; size) being contiguous in =
memory but frames are scattered into different<br>&gt;&gt;&gt;&gt;&gt;&gt; =
locations. We could not definitely submit frame by frame as it would be<br>

&gt;&gt;&gt;&gt;&gt;&gt; software overhead (HW interrupting for each frame)=
 resulting in video lags.<br>&gt;&gt;&gt;&gt;&gt;&gt;<br>&gt;&gt;&gt;&gt;&g=
t; IIUIC, it is 30fps and one dma interrupt per frame ... it doesn&#39;t se=
em<br>

&gt;&gt;&gt;&gt;&gt; inefficient at all. Even poor-latency audio would gene=
rate a higher<br>&gt;&gt;&gt;&gt;&gt; interrupt-rate. So the &quot;ineffici=
ency concern&quot; doesn&#39;t seem valid to<br>&gt;&gt;&gt;&gt;&gt; me.<br=
>

&gt;&gt;&gt;&gt;&gt;<br>&gt;&gt;&gt;&gt;&gt; Not to mean we shouldn&#39;t s=
trive to reduce the interrupt-rate further.<br>&gt;&gt;&gt;&gt;&gt; Another=
 option is to emulate the ring-buffer scheme of ALSA.... which<br>&gt;&gt;&=
gt;&gt;&gt; should be possible since for a session of video playback the fr=
ame<br>

&gt;&gt;&gt;&gt;&gt; buffers&#39; locations wouldn&#39;t change.<br>&gt;&gt=
;&gt;&gt;&gt;<br>&gt;&gt;&gt;&gt;&gt; Yet another option is to use the full=
 potential of the<br>&gt;&gt;&gt;&gt;&gt; interleaved-xfer api as such. It =
seems you confuse a &#39;video frame&#39;<br>

&gt;&gt;&gt;&gt;&gt; with the interleaved-xfer api&#39;s &#39;frame&#39;. T=
hey are different.<br>&gt;&gt;&gt;&gt;&gt;<br>&gt;&gt;&gt;&gt;&gt; Assuming=
 your one video frame is F bytes long and Gk is the gap in<br>&gt;&gt;&gt;&=
gt;&gt; bytes between end of frame [k] and start of frame [k+1] and =A0Gi !=
=3D Gj<br>

&gt;&gt;&gt;&gt;&gt; for i!=3Dj<br>&gt;&gt;&gt;&gt;&gt; In the context of i=
nterleaved-xfer api, you have just 1 Frame of 16<br>&gt;&gt;&gt;&gt;&gt; ch=
unks. Each chunk is Fbytes and the inter-chunk-gap(ICG) is Gk =A0where<br>
&gt;&gt;&gt;&gt;&gt; 0&lt;=3Dk&lt;15<br>
&gt;&gt;&gt;&gt;&gt; So for your use-case .....<br>&gt;&gt;&gt;&gt;&gt; =A0=
 dma_interleaved_template.numf =3D 1 =A0 /* just 1 frame */<br>&gt;&gt;&gt;=
&gt;&gt; =A0 dma_interleaved_template.frame_size =3D 16 =A0/* containing 16=
 chunks */<br>

&gt;&gt;&gt;&gt;&gt; =A0 =A0...... //other parameters<br>&gt;&gt;&gt;&gt;&g=
t;<br>&gt;&gt;&gt;&gt;&gt; You have 3 options to choose from and all should=
 work just as fine.<br>&gt;&gt;&gt;&gt;&gt; Otherwise please state your pro=
blem in real numbers (video-frames&#39;<br>

&gt;&gt;&gt;&gt;&gt; size, count &amp; gap in bytes).<br>&gt;&gt;&gt;&gt;<b=
r>&gt;&gt;&gt;&gt; Initially I interpreted interleaved template the same. =
=A0But, Lars corrected me<br>&gt;&gt;&gt;&gt; in the subsequent discussion =
and let me put it here briefly,<br>

&gt;&gt;&gt;&gt;<br>&gt;&gt;&gt;&gt; In the interleaved template, each fram=
e represents a line of size denoted by<br>&gt;&gt;&gt;&gt; chunk.size and t=
he stride by icg. =A0&#39;numf&#39; represent number of frames i.e.<br>&gt;=
&gt;&gt;&gt; number of lines.<br>

&gt;&gt;&gt;&gt;<br>&gt;&gt;&gt;&gt; In video frame context,<br>&gt;&gt;&gt=
;&gt; chunk.size -&gt; hsize<br>&gt;&gt;&gt;&gt; chunk.icg -&gt; stride<br>=
&gt;&gt;&gt;&gt; numf -&gt; vsize<br>&gt;&gt;&gt;&gt; and frame_size is alw=
ays 1 as it will have only one chunk in a line.<br>

&gt;&gt;&gt;&gt;<br>&gt;&gt;&gt; But you said in your last post<br>&gt;&gt;=
&gt; =A0 &quot;with each frame (a typical video frame size) being contiguou=
s in memory&quot;<br>&gt;&gt;&gt; =A0... which is not true from what you wr=
ite above. Anyways, my first 2<br>

&gt;&gt;&gt; suggestions still hold.<br>&gt;&gt;<br>&gt;&gt; Yes, each vide=
o frame is contiguous and they can be scattered.<br>&gt;&gt;<br>&gt; I assu=
me by contiguous frame you mean as in framebuffer? =A0Which is an<br>&gt; a=
rray of bytes.<br>

&gt; If yes, then you should do as I suggest first, =A0frame_size=3D16 =A0a=
nd numf=3D1.<br><br>I think am confusing you. =A0I would like to explain wi=
th an example. =A0Lets say<br>each video frame is 4k size starting at addre=
ss 0x10004000 (-0x10005000) and<div>
other frame at=A00x20002000 (-0x20003000), and so on. =A0So, the frames are=
</div><div>scattered in memory and as the=A0template doesnt allow multiple =
src_start/</div><div>dst_start we could not use single=A0template to fill t=
he HW descriptors (of=A0</div>
<div>frames). =A0So, I feel your suggestion=A0might not work if the frames =
are scattered.</div><div>Also, how could we get &#39;vsize&#39;=A0value in =
your approach? =A0More importantly,=A0</div><div>we are overriding the sema=
ntics=A0of interleaved template members.<br>
<br>&gt;<br>&gt; If no, then it seems you are already doing the right thing=
.... the<br>
&gt; ring-buffer scheme. Please share some stats how the current api is<br>=
&gt; causing you overhead because that is a very common case (many<br>&gt; =
controllers support LLI) and you have 467ms (@30fps with 16-frames<br>
&gt; ring-buffer) to queue in before you see any frame drop.<br>
<br>As I mentioned earlier in the thread, our hardware has a SG engine wher=
e by<br>we could send multiple frames in a batch. =A0Using the original imp=
lementation<br>of interleaved API, we have three options to transfer. =A0<b=
r>

<br>One is to send frame by frame to the hardware. =A0We get a async_tx des=
c for<br>each frame and then we submit it to hardware triggering it to tran=
sfer this BD.<br>We queue the next descriptor on the pending queue and when=
ever there is<br>

a completion interrupt we submit the next BD on this queue to hardware. In<=
br>this implementation we are not efficiently using the SG engine in the ha=
rdware<br>as we transferring frame by frame even HW allows us to transfer m=
ultiple frames.<br>

<br>The second option is to queue all the BDs until the maximum frames that=
 HW is<br>capable to transfer in a batch and then submit to SG engine in th=
e HW. =A0With<br>this approach I feel there will be additional software ove=
rhead to track the number<br>

of maximum transfers and few additional cycles to release the cookie of eac=
h desc.<div>Here, each desc represents a frame.<br><br>The last option is t=
he current implementation of the driver along with this change in<br>API. =
=A0It will allow us to send array of interleaved templates wherein we could=
 allocate<br>

a single async desc which will handle multiple frames (or segments) and jus=
t submit<br>this desc to HW. =A0Then we program the current to first frame,=
 tail to last frame and<br>HW will complete this transfer. =A0Here, each de=
sc represents multiple frames.<br>

<br>My point here is the driver should use hardware resources efficiently a=
nd I feel the</div><div>driver will be inefficient if we dont use them.=A0<=
/div><div><br>I request you to please go through our hardware specification=
 to get an overview of<br>
implementation and provide me your suggestions. =A0Here is the link,<br><a =
href=3D"http://www.xilinx.com/support/documentation/ip_documentation/axi_vd=
ma/v6_1/pg020_axi_vdma.pdf" target=3D"_blank">http://www.xilinx.com/support=
/documentation/ip_documentation/axi_vdma/v6_1/pg020_axi_vdma.pdf</a><div>

<br></div><div>Srikanth<br></div><div><br>&gt;<br>&gt; Regards,<br>&gt; Jas=
si<br>&gt; --<br>&gt; To unsubscribe from this list: send the line &quot;un=
subscribe linux-kernel&quot; in<br>&gt; the body of a message to <a href=3D=
"mailto:majordomo@vger.kernel.org" target=3D"_blank">majordomo@vger.kernel.=
org</a><br>

&gt; More majordomo info at =A0<a href=3D"http://vger.kernel.org/majordomo-=
info.html" target=3D"_blank">http://vger.kernel.org/majordomo-info.html</a>=
<br>&gt; Please read the FAQ at =A0<a href=3D"http://www.tux.org/lkml/" tar=
get=3D"_blank">http://www.tux.org/lkml/</a></div>

</div></div></div>

--089e01229710d2468a04f2eb8f07--
