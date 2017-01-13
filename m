From: Appana Durga Kedareswara Rao <appana.durga.rao-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org>
Subject: RE: [PATCH v5 3/3] dmaengine: xilinx_dma: Fix race condition in the
 driver for multiple descriptor scenario
Date: Fri, 13 Jan 2017 06:00:44 +0000
Message-ID: <C246CAC1457055469EF09E3A7AC4E11A4A6666CF@XAP-PVEXMBX01.xlnx.xilinx.com>
References: <1483771530-8545-1-git-send-email-appanad@xilinx.com>
 <1483771530-8545-4-git-send-email-appanad@xilinx.com>
 <20170110084917.GA3573@localhost>
 <C246CAC1457055469EF09E3A7AC4E11A4A6662F1@XAP-PVEXMBX01.xlnx.xilinx.com>
 <20170113053627.GQ3573@localhost>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20170113053627.GQ3573@localhost>
Content-Language: en-US
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Vinod Koul <vinod.koul-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>
Cc: "robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org" <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, "mark.rutland-5wv7dgnIgG8@public.gmane.org" <mark.rutland-5wv7dgnIgG8@public.gmane.org>, "dan.j.williams-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org" <dan.j.williams-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>, "michal.simek-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org" <michal.simek-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org>, Soren Brinkmann <sorenb-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org>, "moritz.fischer-+aYTwkv1SeIAvxtiuMwx3w@public.gmane.org" <moritz.fischer-+aYTwkv1SeIAvxtiuMwx3w@public.gmane.org>, "laurent.pinchart-ryLnwIuWjnjg/C1BVhZhaw@public.gmane.org" <laurent.pinchart-ryLnwIuWjnjg/C1BVhZhaw@public.gmane.org>, "luis-HiykPkW1eAzzDCI4PIEvbQC/G2K4zDHf@public.gmane.org" <luis-HiykPkW1eAzzDCI4PIEvbQC/G2K4zDHf@public.gmane.org>, "Jose.Abreu-HKixBCOQz3hWk0Htik3J/w@public.gmane.org" <Jose.Abreu-HKixBCOQz3hWk0Htik3J/w@public.gmane.org>, "dmaengine-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <dmaengine-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hi Vinod,

	Thanks for the review...

[Snip]
> >
> > > On Sat, Jan 07, 2017 at 12:15:30PM +0530, Kedareswara rao Appana wrot=
e:
> > > > When driver is handling AXI DMA SoftIP When user submits multiple
> > > > descriptors back to back on the S2MM(recv) side with the current
> > > > driver flow the last buffer descriptor next bd points to a invalid
> > > > location resulting the invalid data or errors in the DMA engine.
> > >
> > > Can you rephrase this, it a bit hard to understand.
> >
> > When DMA is receiving packets h/w expects the descriptors Should be in
> > the form of a ring (I mean h/w buffer descriptor Next descriptor field
> > should always point to valid address So that when DMA engine go and
> > fetch that next descriptor it always Sees a valid address).
> >
> >
> > But with the current driver implementation when user queues Multiple
> > descriptors the last descriptor next descriptor field Pointing to an
> > invalid location causing data corruption or Errors from the DMA h/w
> > engine...
> >
> > To avoid this issue creating a Buffer descriptor Chain during Channel
> > allocation and using those buffer descriptors for processing User
> > requested data.
>=20
> Is it not doable to to modify the next pointer to point to subsequent tra=
nsaction.
> IOW you are modifying tail descriptor to point to subsequent descriptor.
>=20
> Btw how and when does DMA stop, assuming it is circular it never would, i=
sn't
> there a valid/stop flag associated with a descriptor which tells DMA engi=
ne what
> to do next

There are two registers that controls the DMA transfers.
Current descriptor and tail descriptor register.=20
When current descriptor reaches tail descriptor dma engine will pause.

When reprogramming the tail descriptor the DMA engine will starts fetching =
descriptors again.

But with the existing driver flow if we reprogram the tail descriptor
The tail descriptor next descriptor field is pointing to an invalid locatio=
n
Causing data corruption...

>=20
>=20
> Btw there is something wrong with your MUA perhaps line are titlecased fo=
r no
> reason. This is typically behavious of non linux tool which may not be gr=
eat tool
> for this work.

Thanks for pointing it out.
I usually replies from outlook from a windows machine.
Will check with others in my team how they configured their mail client.

>=20
> >
> > Please let me know if the above explanation is not clear will explain i=
n detail....
> >
> > >
> > > >
> > > > This patch fixes this issue by creating a BD Chain during
> > >
> > > whats a BD?
> >
> > Buffer descriptor.
>=20
> Thats nowhere mentioned..

Yep sorry I should have been mentioned it...

Regards,
Kedar.

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
