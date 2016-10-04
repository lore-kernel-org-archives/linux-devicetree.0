From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH v3 1/2] dt-bindings: display: Add Sharp LQ150X1LG11 panel binding
Date: Tue, 4 Oct 2016 08:11:49 -0500
Message-ID: <CAL_Jsq+iuBOOAfwT6FK9LkzcLTPwRF47uizaCcqSk1Y+JTJk0A@mail.gmail.com>
References: <1474928832-8766-1-git-send-email-peda@axentia.se>
 <1474928832-8766-2-git-send-email-peda@axentia.se> <20161003184645.GA23584@rob-hp-laptop>
 <f48111d6-f924-3520-05ca-e77b0f51a26d@axentia.se>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <f48111d6-f924-3520-05ca-e77b0f51a26d@axentia.se>
Sender: linux-kernel-owner@vger.kernel.org
To: Peter Rosin <peda@axentia.se>
Cc: open list <linux-kernel@vger.kernel.org>, Thierry Reding <thierry.reding@gmail.com>, David Airlie <airlied@linux.ie>, Mark Rutland <mark.rutland@arm.com>, dri-devel <dri-devel@lists.freedesktop.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, =?UTF-8?Q?Gustaf_Lindstr=C3=B6m?= <gl@axentia.se>
List-Id: devicetree@vger.kernel.org

On Mon, Oct 3, 2016 at 11:58 PM, Peter Rosin <peda@axentia.se> wrote:
> On 2016-10-03 20:46, Rob Herring wrote:
>> On Tue, Sep 27, 2016 at 12:27:11AM +0200, Peter Rosin wrote:
>>> The Sharp 15" LQ150X1LG11 panel is an XGA TFT LCD panel.
>>>
>>> Signed-off-by: Peter Rosin <peda@axentia.se>
>>> ---
>>>  .../bindings/display/panel/sharp,lq150x1lg11.txt   | 36 ++++++++++++++++++++++
>>>  1 file changed, 36 insertions(+)
>>>  create mode 100644 Documentation/devicetree/bindings/display/panel/sharp,lq150x1lg11.txt
>>>
>>> diff --git a/Documentation/devicetree/bindings/display/panel/sharp,lq150x1lg11.txt b/Documentation/devicetree/bindings/display/panel/sharp,lq150x1lg11.txt
>>> new file mode 100644
>>> index 000000000000..715ff7e332f2
>>> --- /dev/null
>>> +++ b/Documentation/devicetree/bindings/display/panel/sharp,lq150x1lg11.txt
>>> @@ -0,0 +1,36 @@
>>> +Sharp 15" LQ150X1LG11 XGA TFT LCD panel
>>> +
>>> +Required properties:
>>> +- compatible: should be "sharp,lq150x1lg11"
>>> +- power-supply: regulator to provide the VCC supply voltage (3.3 volts)
>>
>> Should be named according to the input, so vcc-supply.
>
> Right, I wanted to do that, but the simple-panel bindings has power-supply
> as required and I desperately wanted to be compatible in order to make use
> of the simple-panel driver. That driver does require this entry, so I do
> not see any way around it. Any advice for this situation?

Okay, it's fine given it's a single supply.

Rob
