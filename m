From: Sylwester Nawrocki <s.nawrocki@samsung.com>
Subject: Re: [PATCH v1 1/2] ASoC: Add DT bindings documentation
 for max98504 amplifier
Date: Mon, 20 Jun 2016 15:49:17 +0200
Message-ID: <5767F45D.5040404@samsung.com>
References: <1466095238-9047-1-git-send-email-s.nawrocki@samsung.com>
 <20160620131522.GA27923@rob-hp-laptop>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <alsa-devel-bounces@alsa-project.org>
In-reply-to: <20160620131522.GA27923@rob-hp-laptop>
List-Unsubscribe: <http://mailman.alsa-project.org/mailman/options/alsa-devel>,
 <mailto:alsa-devel-request@alsa-project.org?subject=unsubscribe>
List-Archive: <http://mailman.alsa-project.org/pipermail/alsa-devel/>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Subscribe: <http://mailman.alsa-project.org/mailman/listinfo/alsa-devel>,
 <mailto:alsa-devel-request@alsa-project.org?subject=subscribe>
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: alsa-devel-bounces@alsa-project.org
To: Rob Herring <robh@kernel.org>
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org, b.zolnierkie@samsung.com, inki.dae@samsung.com, broonie@kernel.org, ideal.song@samsung.com
List-Id: devicetree@vger.kernel.org

On 06/20/2016 03:15 PM, Rob Herring wrote:
>> diff --git a/Documentation/devicetree/bindings/sound/max98504.txt 
>> b/Documentation/devicetree/bindings/sound/max98504.txt
>> > new file mode 100644
>> > index 0000000..7aa5b93
>> > --- /dev/null
>> > +++ b/Documentation/devicetree/bindings/sound/max98504.txt
>> > @@ -0,0 +1,22 @@
>> > +Maxim MAX98504 class D mono speaker amplifier
>> > +
>> > +This device supports I2C control interface and an IRQ output signal. It features
>> > +a PCM and PDM digital audio interface (DAI) and a differential analog input.
>
> Where's the IRQ in the binding?

It seems I didn't do my homework and didn't add it here, even though
the driver currently uses the interrupt. I'll add something like this
in next iteration:

 - interrupts : should specify the interrupt the device is connected to,
   as described in ../interrupt-controller/interrupts.txt
