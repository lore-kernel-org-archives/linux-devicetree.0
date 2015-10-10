From: Stephen Boyd <sboyd@codeaurora.org>
Subject: Re: [PATCH v2 1/2] devicetree: add binding for generic mmio
 clocksource
Date: Fri, 9 Oct 2015 17:01:18 -0700
Message-ID: <20151010000118.GV26883@codeaurora.org>
References: <1444232234-2133-1-git-send-email-mans@mansr.com>
 <20151007154727.GC28981@leverpostej>
 <yw1xvbaik4mn.fsf@unicorn.mansr.com>
 <CAL_JsqJDZKTB8xowVdGK=9=4omp_wHdwqYP_Ln3-QdknjAwxSg@mail.gmail.com>
 <yw1xmvvtk906.fsf@unicorn.mansr.com>
 <yw1xy4fchv4z.fsf@unicorn.mansr.com>
 <CAL_JsqLSyCAFCHythKyyAXg_yEPLzdYA+tJq2cj_NnXL+Et5GQ@mail.gmail.com>
 <20151009184632.GR26883@codeaurora.org>
 <yw1xio6fitzd.fsf@unicorn.mansr.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <yw1xio6fitzd.fsf@unicorn.mansr.com>
Sender: linux-kernel-owner@vger.kernel.org
To: =?iso-8859-1?Q?M=E5ns_Rullg=E5rd?= <mans@mansr.com>
Cc: Rob Herring <robherring2@gmail.com>, Mark Rutland <mark.rutland@arm.com>, Pawel Moll <pawel.moll@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

On 10/09, M=E5ns Rullg=E5rd wrote:
> Stephen Boyd <sboyd@codeaurora.org> writes:
> >
> > Does that mean a flag day? Urgh. Pain. I'm not opposed to adding
> > a pointer, in fact it might be better for performance so that we
> > don't take a cache miss in read() functions that need to load
> > some pointer. We were talking about that problem a few months
> > ago, but nothing came of it.
>=20
> I've sent a patch.  Let the flames begin.
>=20

I never got it. Was I Cced?

--=20
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
a Linux Foundation Collaborative Project
