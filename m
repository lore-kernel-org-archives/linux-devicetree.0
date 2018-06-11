From: Avi Fishman <avifishman70@gmail.com>
Subject: Re: [PATCH v4 2/3] dt-bindings: usb: new ehci-npcm7xx dt
Date: Mon, 11 Jun 2018 21:24:35 +0300
Message-ID: <CAKKbWA4gm1x8VazdMjZ6a9bwGmt=_mZYS2S3FnB2x36Ng+cjCQ@mail.gmail.com>
References: <20180607145821.322979-1-avifishman70@gmail.com>
 <20180607145821.322979-3-avifishman70@gmail.com> <20180611181646.GA5537@rob-hp-laptop>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180611181646.GA5537@rob-hp-laptop>
Sender: linux-kernel-owner@vger.kernel.org
To: Rob Herring <robh@kernel.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Alan Stern <stern@rowland.harvard.edu>, Tomer Maimon <tmaimon77@gmail.com>, Patrick Venture <venture@google.com>, Nancy Yuen <yuenn@google.com>, Brendan Higgins <brendanhiggins@google.com>, mathias.nyman@linux.intel.com, bjorn.andersson@linaro.org, jhogan@kernel.org, albeu@free.fr, chunfeng.yun@mediatek.com, Tony Lindgren <tony@atomide.com>, baolu.lu@linux.intel.com, Alex Elder <elder@linaro.org>, Dmitry Osipenko <digetx@gmail.com>, Kate Stewart <kstewart@linuxfoundation.org>, hdegoede@redhat.com, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, linux-usb@vger.kernel.org, OpenBMC Maillist <openbmc@lists.ozlabs.org>, Mark Rutland <mark.rutland@arm.com>, devicetree <devicetree@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

On Mon, Jun 11, 2018 at 9:16 PM, Rob Herring <robh@kernel.org> wrote:
> On Thu, Jun 07, 2018 at 05:58:20PM +0300, avifishman70@gmail.com wrote:
>> From: Avi Fishman <AviFishman70@gmail.com>
>>
>> Device Tree documentation for Nuvoton npcm7xx EHCI.
>>
>> Signed-off-by: Avi Fishman <AviFishman70@gmail.com>

Reviewed-by: Rob Herring <robh@kernel.org>
Rob, if I understand you want me to add another version (v5) with the
above line (only on the dt)?

>> ---
>>  Documentation/devicetree/bindings/usb/npcm7xx-usb.txt | 17 +++++++++++++++++
>>  1 file changed, 17 insertions(+)
>>  create mode 100644 Documentation/devicetree/bindings/usb/npcm7xx-usb.txt
>
> Please add acks/reviewed-bys when posting new versions.
>
> Rob
