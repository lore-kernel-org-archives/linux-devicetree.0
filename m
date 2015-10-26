From: =?iso-8859-1?Q?M=E5ns_Rullg=E5rd?= <mans@mansr.com>
Subject: Re: [PATCH 2/3] devicetree: add binding for Aurora VLSI NB8800 Ethernet controller
Date: Mon, 26 Oct 2015 14:11:21 +0000
Message-ID: <yw1xk2q9en3q.fsf@unicorn.mansr.com>
References: <1445522558-5808-1-git-send-email-mans@mansr.com>
	<1445522558-5808-2-git-send-email-mans@mansr.com>
	<562A23B9.3090208@sigmadesigns.com>
	<yw1xio5xg0rq.fsf@unicorn.mansr.com>
	<562DF394.3030500@sigmadesigns.com>
	<yw1x1tchg7i6.fsf@unicorn.mansr.com>
	<562E2A61.2080306@sigmadesigns.com>
	<yw1xsi4xenwd.fsf@unicorn.mansr.com>
	<562E330E.1060509@sigmadesigns.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <562E330E.1060509@sigmadesigns.com> (Marc Gonzalez's message of
	"Mon, 26 Oct 2015 15:05:02 +0100")
Sender: linux-kernel-owner@vger.kernel.org
To: Marc Gonzalez <marc_gonzalez@sigmadesigns.com>
Cc: DT <devicetree@vger.kernel.org>, Kumar Gala <galak@codeaurora.org>, Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, linux-kernel@vger.kernel.org, Sebastian Frias <sebastian_frias@sigmadesigns.com>, Thibaud Cornic <thibaud_cornic@sigmadesigns.com>, Mason <slash.tmp@free.fr>
List-Id: devicetree@vger.kernel.org

Marc Gonzalez <marc_gonzalez@sigmadesigns.com> writes:

> On 26/10/2015 14:54, M=E5ns Rullg=E5rd wrote:
>
>> Let's try something else:
>>=20
>> Device trees list the exact chip, the oldest chip with the same
>> features, and the oldest compatible chip.  From the sound of things,
>> that means the smp8759 should use "sigma,smp8759-ethernet",
>> "sigma,smp8910-ethernet", "sigma,smp8642-ethernet", "aurora,nb8800".
>
> (I want to make sure I didn't misunderstand.) In my hypothetical
> example where something changed in 8756 and up...
>
> for a 8734 DT, I would specify: smp8734, smp8910, smp8642, nb8800
> for a 8758 DT, I would specify: smp8758, smp8756, smp8642, nb8800

If the 8756 were still compatible with 8910 (which has features not in
8642), it should include both.  The list gets long, but it's probably
the least maintenance in the end.

--=20
M=E5ns Rullg=E5rd
mans@mansr.com
