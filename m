MIME-Version: 1.0
In-Reply-To: <20170628185152.h5dngp4tgwztgtcu@sirena.org.uk>
References: <1498578321-13980-1-git-send-email-amelie.delaunay@st.com>
	<1498578321-13980-2-git-send-email-amelie.delaunay@st.com>
	<20170628185152.h5dngp4tgwztgtcu@sirena.org.uk>
Date: Wed, 28 Jun 2017 17:19:00 -0500
Message-ID: <CAL_JsqJSx2TEXV8LfCSN6+zDfPnd7ZbK8tQOCSBMn9=TKnZnOQ@mail.gmail.com>
Subject: Re: [PATCHv2 1/9] dt-bindings: spi: stm32: use SoC specific compatible
From: Rob Herring <robh+dt@kernel.org>
Content-Type: text/plain; charset="UTF-8"
To: Mark Brown <broonie@kernel.org>
Cc: Amelie Delaunay <amelie.delaunay@st.com>, Mark Rutland <mark.rutland@arm.com>, Maxime Coquelin <mcoquelin.stm32@gmail.com>, Alexandre Torgue <alexandre.torgue@st.com>, "linux-spi@vger.kernel.org" <linux-spi@vger.kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
List-ID: <devicetree@vger.kernel.org>

On Wed, Jun 28, 2017 at 1:51 PM, Mark Brown <broonie@kernel.org> wrote:
> On Tue, Jun 27, 2017 at 05:45:13PM +0200, Amelie Delaunay wrote:
>> This patch replaces st,stm32-spi compatible with st,stm32h7-spi SoC
>> specific compatible and updates the example accondingly.
>
> Please use subject lines matching the style for the subsystem.  This
> makes it easier for people to identify relevant patches.

I've started getting more picky on the subject lines for bindings. It's getting a bit better in consistency:

$ git log --oneline origin/master..next/master --no-merges -- Documentation/devicetree/bindings/

Can you 
