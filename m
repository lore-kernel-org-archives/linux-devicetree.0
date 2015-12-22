From: Rob Herring <robh@kernel.org>
Subject: Re: [RESEND PATCH v2 2/2] ASoC: atmel-classd: DT binding for PDMIC driver
Date: Tue, 22 Dec 2015 12:37:24 -0600
Message-ID: <CAL_JsqKTNJ6Y0OUydkef3aYUO2jzDb30myvGJau-RBoJ3qe8hQ@mail.gmail.com>
References: <1450345800-21299-1-git-send-email-songjun.wu@atmel.com>
 <1450345800-21299-3-git-send-email-songjun.wu@atmel.com> <20151219040913.D0F442C02FD@rob-hp-laptop>
 <20151219113055.GF5727@sirena.org.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20151219113055.GF5727@sirena.org.uk>
Sender: linux-kernel-owner@vger.kernel.org
To: Mark Brown <broonie@kernel.org>
Cc: Songjun Wu <songjun.wu@atmel.com>, Nicolas Ferre <nicolas.ferre@atmel.com>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

On Sat, Dec 19, 2015 at 5:30 AM, Mark Brown <broonie@kernel.org> wrote:
> On Fri, Dec 18, 2015 at 01:56:21PM -0600, Rob Herring wrote:
>> On Thu, Dec 17, 2015 at 05:50:00PM +0800, Songjun Wu wrote:
>
>> > +- atmel,model
>> > +   The user-visible name of this sound card.
>> > +   The default value is "PDMIC".
>
>> When and why would this be different than the default?
>
>> "label" can be used here if this is really needed.
>
> The plastics for the system are often very important for audio
> configuration - we need userspace to be able to distinguish between
> systems that are identical even on the electrical level.

Okay. That is exactly what label is for, so please use it.

Rob
