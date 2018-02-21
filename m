From: Brendan Higgins <brendanhiggins@google.com>
Subject: Re: [PATCH v2 1/1] clk: npcm750: update text with fixed clocks
Date: Wed, 21 Feb 2018 10:22:00 -0800
Message-ID: <CAFd5g470T=bd-mg2C8DerOx0p7Nj2A6JhS0GueP8y8DLr3JN0w@mail.gmail.com>
References: <1518701959-22899-1-git-send-email-tali.perry1@gmail.com>
 <1518701959-22899-2-git-send-email-tali.perry1@gmail.com>
 <CAFd5g44gBJp0-mYEWGdyiA67BCi2pZWAG2bYPS-WdJEwH1oA5A@mail.gmail.com>
 <20180219144905.bfrycjnas7dcuo34@rob-hp-laptop>
 <CAFd5g44argF0oaOq7fOM0YbCBK5h8NyRia+H8CbRC5qAQHe5WA@mail.gmail.com>
 <CAL_JsqKq-+fKapT6RKwqBubRuJszpKMJevS7NOObPP-bVA2_kw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <CAL_JsqKq-+fKapT6RKwqBubRuJszpKMJevS7NOObPP-bVA2_kw@mail.gmail.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Rob Herring <robh@kernel.org>
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree <devicetree@vger.kernel.org>, Tomer Maimon <tmaimon77@gmail.com>, Avi Fishman <avifishman70@gmail.com>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, OpenBMC Maillist <openbmc@lists.ozlabs.org>, Russell King <linux@armlinux.org.uk>, Tali Perry <tali.perry1@gmail.com>, Nancy Yuen <yuenn@google.com>, Patrick Venture <venture@google.com>, Rick Altherr <raltherr@google.com>, Linux ARM <linux-arm-kernel@lists.infradead.org>
List-Id: devicetree@vger.kernel.org

On Wed, Feb 21, 2018 at 5:23 AM, Rob Herring <robh@kernel.org> wrote:
> On Tue, Feb 20, 2018 at 10:47 PM, Brendan Higgins
> <brendanhiggins@google.com> wrote:
>> On Mon, Feb 19, 2018 at 6:49 AM, Rob Herring <robh@kernel.org> wrote:
>>> On Thu, Feb 15, 2018 at 02:38:12PM -0800, Brendan Higgins wrote:
>>>> On Thu, Feb 15, 2018 at 5:39 AM, Tali Perry <tali.perry1@gmail.com> wrote:
>>>> >
>>>> > Signed-off-by: Tali Perry <tali.perry1@gmail.com>
>>>> >
>>>>  <snip>
>>>>
>>>> I think this should probably be rolled into [PATCH v2 1/1] npcm750: add fixed
>>>> clocks (moved from drivers/clk/clk-npcm7xx.c):
>>>> https://www.spinics.net/lists/arm-kernel/msg634678.html
>>>
>>> No, binding docs, dts files and driver code should all be separate
>>> patches.
>>
>> My mistake. This patch has a dt-bindings include file; should the include file
>> go in here, with the dtsi changes, or in its own separate patch?
>
> It defines the binding, so with the binding documentation.
>

So two things, first off, the include file I was asking about is not a dtsi, but
a file that defines a bunch of macros for referencing clocks. I don't know if
that makes a difference.

Second, the patch that I referenced above, "[PATCH v2 1/1] npcm750: add fixed
clocks (moved from drivers/clk/clk-npcm7xx.c):
https://www.spinics.net/lists/arm-kernel/msg634678.html", *does* contain a dtsi
and nothing else, and defines these bindings, which is why I thought it went in
with the binding docs.

Cheers
