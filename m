From: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: Re: [PATCH] dt-bindings: arm: fix the document ID for SCMI protocol
 documentation
Date: Thu, 23 May 2019 17:24:56 +0000
Message-ID: <877eah84nr.fsf@epam.com>
References: <20190523112312.24529-1-volodymyr_babchuk@epam.com>
 <20190523170938.GC4224@e107155-lin>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20190523170938.GC4224@e107155-lin>
Content-Language: en-US
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Sudeep Holla <sudeep.holla@arm.com>
Cc: Mark Rutland <mark.rutland@arm.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "trivial@kernel.org" <trivial@kernel.org>, Rob Herring <robh+dt@kernel.org>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
List-Id: devicetree@vger.kernel.org


Hi,

Sudeep Holla writes:

> On Thu, May 23, 2019 at 11:23:35AM +0000, Volodymyr Babchuk wrote:
>> From: Volodymyr Babchuk <volodymyr_babchuk@epam.com

I accidentally deleted ending ">" symbol in the line above, so "git
send-email" decided to move that line from headers to the message body.

>> arm,scmi.txt used the wrong document identifier. "ARM DUI 0922B" is
>> the "ARM Compute Subsystem SCP, Message Interface Protocols". What we
>> need is the ARM DEN 0056A - "ARM System Control and Management
>> Interface Platform Design Document".
>>
>
> Indeed, it's most stupid copy-paste mistake. Thanks for fixing this.
> Applied now.
It happens all the time. I also did stupid mistake in my patch file. It
is described above. Could you please ensure that this line will be not
in the resulting commit message? Thank you.

-- 
Best regards,Volodymyr Babchuk
