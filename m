From: Marc Gonzalez <marc_gonzalez@sigmadesigns.com>
Subject: Re: [PATCH 2/3] devicetree: add binding for Aurora VLSI NB8800
 Ethernet controller
Date: Mon, 26 Oct 2015 15:05:02 +0100
Message-ID: <562E330E.1060509@sigmadesigns.com>
References: <1445522558-5808-1-git-send-email-mans@mansr.com>
 <1445522558-5808-2-git-send-email-mans@mansr.com>
 <562A23B9.3090208@sigmadesigns.com> <yw1xio5xg0rq.fsf@unicorn.mansr.com>
 <562DF394.3030500@sigmadesigns.com> <yw1x1tchg7i6.fsf@unicorn.mansr.com>
 <562E2A61.2080306@sigmadesigns.com> <yw1xsi4xenwd.fsf@unicorn.mansr.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <yw1xsi4xenwd.fsf@unicorn.mansr.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Mans Rullgard <mans@mansr.com>
Cc: DT <devicetree@vger.kernel.org>, Kumar Gala <galak@codeaurora.org>, Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, linux-kernel@vger.kernel.org, Sebastian Frias <sebastian_frias@sigmadesigns.com>, Thibaud Cornic <thibaud_cornic@sigmadesigns.com>, Mason <slash.tmp@free.fr>
List-Id: devicetree@vger.kernel.org

On 26/10/2015 14:54, M=E5ns Rullg=E5rd wrote:

> Let's try something else:
>=20
> Device trees list the exact chip, the oldest chip with the same
> features, and the oldest compatible chip.  From the sound of things,
> that means the smp8759 should use "sigma,smp8759-ethernet",
> "sigma,smp8910-ethernet", "sigma,smp8642-ethernet", "aurora,nb8800".

(I want to make sure I didn't misunderstand.) In my hypothetical
example where something changed in 8756 and up...

for a 8734 DT, I would specify: smp8734, smp8910, smp8642, nb8800
for a 8758 DT, I would specify: smp8758, smp8756, smp8642, nb8800

Is that correct? If yes, that works for me.

Regards.
