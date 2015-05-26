From: Lars-Peter Clausen <lars@metafoo.de>
Subject: Re: [PATCH 2/2] iio: adc: xilinx-xadc: Add xlnx,extend-name as an
 optional argument for aux channels
Date: Tue, 26 May 2015 11:38:40 +0200
Message-ID: <55643F20.4080306@metafoo.de>
References: <1431038644-41600-1-git-send-email-xander.huff@ni.com>
 <1431038644-41600-2-git-send-email-xander.huff@ni.com>
 <555B78A3.2030202@metafoo.de> <55606340.1090403@kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <55606340.1090403@kernel.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Jonathan Cameron <jic23@kernel.org>, Xander Huff <xander.huff@ni.com>, robh+dt@kernel.org, pawel.moll@arm.com, mark.rutland@arm.com, ijc+devicetree@hellion.org.uk, galak@codeaurora.org
Cc: devicetree@vger.kernel.org, joe.hershberger@ni.com, linux-iio@vger.kernel.org, joshc@ni.com, michal.simek@xilinx.com, ben.shelton@ni.com, soren.brinkmann@xilinx.com, pmeerw@pmeerw.net, knaack.h@gmx.de, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

On 05/23/2015 01:23 PM, Jonathan Cameron wrote:
> On 19/05/15 18:53, Lars-Peter Clausen wrote:
>> On 05/08/2015 12:44 AM, Xander Huff wrote:
>>> To better facilitate user-mode access to optional aux channels, allow
>>> device trees to specify a custom extended name for defined channels.
>>
>> Hi,
>>
>> 'extend-name' is kind of a IIO specific term. I think a better name in the devicetree context would be 'label'. That's used everywhere else when giving a short description string to a node.
>>
> Hi Lars,
>
> What do you think of the general idea?  I'm unconvinced we want to do this in channel naming.
> Perhaps we want an additional attribute giving access to this sort of 'semantic' information?

I'm not convinced about it either. My gut feeling is that this is not the 
right approach, but I don't really have any better ideas at the moment.

Xander can you give a short description of how this information will be used 
by an application? Would having a label property for the channel also work 
for you (e.g. in_voltage0_label)?

- Lars
