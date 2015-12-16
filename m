From: =?iso-8859-1?Q?M=E5ns_Rullg=E5rd?= <mans@mansr.com>
Subject: Re: [PATCH 1/2] devicetree: sound: add binding for WM8974 codec
Date: Wed, 16 Dec 2015 13:54:20 +0000
Message-ID: <yw1xk2oeebxv.fsf@unicorn.mansr.com>
References: <1450270975-17955-1-git-send-email-mans@mansr.com>
	<yw1xoadqeczx.fsf@unicorn.mansr.com>
	<20151216134411.GM5727@sirena.org.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20151216134411.GM5727@sirena.org.uk> (Mark Brown's message of
	"Wed, 16 Dec 2015 13:44:11 +0000")
Sender: linux-kernel-owner@vger.kernel.org
To: Mark Brown <broonie@kernel.org>
Cc: Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Mark Brown <broonie@kernel.org> writes:

> On Wed, Dec 16, 2015 at 01:31:30PM +0000, M=E5ns Rullg=E5rd wrote:
>
>> This is the 1/1 you were missing.
>
> I need the patch in a form I can apply.

I assumed your email client had some way of displaying the message I
replied to.  Guess I was wrong.

>> Am I the only one who is annoyed by scripts/get_maintainer.pl not
>> returning all the addresses it should in cases like this?  Is there =
some
>> trick I'm missing?
>
> You can't blindly rely on get_maintainers, it's prone to both false
> positives (CCing too many people, especially if you enable git matchi=
ng
> when it often starts spamming people who are just doing global cleanu=
ps)
> and false negatives (if you don't enable git matching and it misses
> people who care about a specific driver).

So in short, I'm supposed to magically divine who wants to see what.

--=20
M=E5ns Rullg=E5rd
