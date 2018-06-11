From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH v4 2/3] dt-bindings: usb: new ehci-npcm7xx dt
Date: Mon, 11 Jun 2018 12:55:47 -0600
Message-ID: <CAL_JsqJYafGzpr8+VQSYJcE5EMo1xZ8NrXTyGBS-7GhU-X+PVg@mail.gmail.com>
References: <20180607145821.322979-1-avifishman70@gmail.com>
 <20180607145821.322979-3-avifishman70@gmail.com> <20180611181646.GA5537@rob-hp-laptop>
 <CAKKbWA4gm1x8VazdMjZ6a9bwGmt=_mZYS2S3FnB2x36Ng+cjCQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <CAKKbWA4gm1x8VazdMjZ6a9bwGmt=_mZYS2S3FnB2x36Ng+cjCQ@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Avi Fishman <avifishman70@gmail.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Alan Stern <stern@rowland.harvard.edu>, Tomer Maimon <tmaimon77@gmail.com>, Patrick Venture <venture@google.com>, Nancy Yuen <yuenn@google.com>, Brendan Higgins <brendanhiggins@google.com>, Mathias Nyman <mathias.nyman@linux.intel.com>, Bjorn Andersson <bjorn.andersson@linaro.org>, James Hogan <jhogan@kernel.org>, Alban <albeu@free.fr>, Chunfeng Yun <chunfeng.yun@mediatek.com>, Tony Lindgren <tony@atomide.com>, baolu.lu@linux.intel.com, Alex Elder <elder@linaro.org>, Dmitry Osipenko <digetx@gmail.com>, Kate Stewart <kstewart@linuxfoundation.org>, Hans de Goede <hdegoede@redhat.com>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux USB List <linux-usb@vger.kernel.org>OpenBMC Maillist <o>
List-Id: devicetree@vger.kernel.org

On Mon, Jun 11, 2018 at 12:24 PM, Avi Fishman <avifishman70@gmail.com> wrote:
> On Mon, Jun 11, 2018 at 9:16 PM, Rob Herring <robh@kernel.org> wrote:
>> On Thu, Jun 07, 2018 at 05:58:20PM +0300, avifishman70@gmail.com wrote:
>>> From: Avi Fishman <AviFishman70@gmail.com>
>>>
>>> Device Tree documentation for Nuvoton npcm7xx EHCI.
>>>
>>> Signed-off-by: Avi Fishman <AviFishman70@gmail.com>
>
> Reviewed-by: Rob Herring <robh@kernel.org>
> Rob, if I understand you want me to add another version (v5) with the
> above line (only on the dt)?

No need to *only* do that. Maintainers will collect them on the last
version when they apply patches. You just can't expect that
maintainers will go look at prior versions and collect them.

>>> ---
>>>  Documentation/devicetree/bindings/usb/npcm7xx-usb.txt | 17 +++++++++++++++++
>>>  1 file changed, 17 insertions(+)
>>>  create mode 100644 Documentation/devicetree/bindings/usb/npcm7xx-usb.txt
>>
>> Please add acks/reviewed-bys when posting new versions.
>>
>> Rob
