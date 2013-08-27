From: Stephen Warren <swarren@wwwdotorg.org>
Subject: Re: [PATCH v2 7/9] watchdog: orion: Update device-tree binding
 documentation
Date: Tue, 27 Aug 2013 15:44:41 -0600
Message-ID: <521D1DC9.5040409@wwwdotorg.org>
References: <1377295942-5955-1-git-send-email-ezequiel.garcia@free-electrons.com>
 <1377295942-5955-8-git-send-email-ezequiel.garcia@free-electrons.com>
 <20130826140843.GI13964@titan.lakedaemon.net>
 <20130827083603.GA2286@localhost>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20130827083603.GA2286@localhost>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Ezequiel Garcia <ezequiel.garcia@free-electrons.com>
Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>, Lior Amsalem <alior@marvell.com>, Jason Cooper <jason@lakedaemon.net>, Andrew Lunn <andrew@lunn.ch>, devicetree@vger.kernel.org, wim@iguana.be, Gregory Clement <gregory.clement@free-electrons.com>, linux-arm-kernel@lists.infradead.org, Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>
List-Id: devicetree@vger.kernel.org

On 08/27/2013 02:36 AM, Ezequiel Garcia wrote:
> On Mon, Aug 26, 2013 at 10:08:43AM -0400, Jason Cooper wrote:
>> On Fri, Aug 23, 2013 at 07:12:20PM -0300, Ezequiel Garcia wrote:
>>> Change the 'reg' property meaning, by defining two required cells.
>>> It's important to note this commit breaks DT-compatibility for this
>>> device.
>>>
>>> Cc: devicetree@vger.kernel.org
>>> Signed-off-by: Ezequiel Garcia <ezequiel.garcia@free-electrons.com>
>>> ---
>>>  Documentation/devicetree/bindings/watchdog/orion-wdt.txt | 7 +++++--
>>>  1 file changed, 5 insertions(+), 2 deletions(-)
>>>
>>> diff --git a/Documentation/devicetree/bindings/watchdog/orion-wdt.txt b/Documentation/devicetree/bindings/watchdog/orion-wdt.txt
>>> index 5dc8d30..a74c9c8 100644
>>> --- a/Documentation/devicetree/bindings/watchdog/orion-wdt.txt
>>> +++ b/Documentation/devicetree/bindings/watchdog/orion-wdt.txt
>>> @@ -3,7 +3,9 @@
>>>  Required Properties:
>>>  
>>>  - Compatibility : "marvell,orion-wdt"
>>> -- reg		: Address of the timer registers
>>> +- reg		: Two cells are required:
>>> +		  First  cell contains the global timer control register.
>>> +		  Second cell contains the watchdog counter register.

BTW, you don't have 2 cells here, but 4 cells (assuming typical
#address-cells and #size-cells values). Instead, you have 2 register
specifiers.
