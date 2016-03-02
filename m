From: "Maciej S. Szmigiero" <mail@maciej.szmigiero.name>
Subject: Re: [PATCH 1/2] dt-bindings: Add URT UMSH-8596MD-xT panel bindings
Date: Wed, 02 Mar 2016 16:22:33 +0100
Message-ID: <56D70539.9050508@maciej.szmigiero.name>
References: <5615885C.5050505@maciej.szmigiero.name> <20151008082444.GC3820@ulmo> <56BFA520.3090302@maciej.szmigiero.name> <20160222025424.GJ15973@rob-hp-laptop>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20160222025424.GJ15973@rob-hp-laptop>
Sender: linux-kernel-owner@vger.kernel.org
To: Thierry Reding <thierry.reding@gmail.com>
Cc: Rob Herring <robh@kernel.org>, dri-devel@lists.freedesktop.org, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, David Airlie <airlied@linux.ie>, linux-kernel <linux-kernel@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

On 22.02.2016 03:54, Rob Herring wrote:
> On Sat, Feb 13, 2016 at 10:50:24PM +0100, Maciej S. Szmigiero wrote:
>> Add DT bindings for United Radiant Technology
>> UMSH-8596MD-xT 7.0" WVGA TFT LCD panels.
>>
>> Signed-off-by: Maciej S. Szmigiero <mail@maciej.szmigiero.name>
>> ---
>> This replaces "of: add URT UMSH-8596MD-xT panel DT bindings"
>> submission.
>>
>>  .../bindings/display/panel/urt,umsh-8596md.txt           | 16 ++++++++++++++++
>>  1 file changed, 16 insertions(+)
>>  create mode 100644 Documentation/devicetree/bindings/display/panel/urt,umsh-8596md.txt
> 
> Acked-by: Rob Herring <robh@kernel.org>


@Thierry:
now that both vendor prefix and DT bindings have been acked
can this panel support be merged?

Maciej
