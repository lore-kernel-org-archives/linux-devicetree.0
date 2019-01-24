From: Michal Simek <michal.simek@xilinx.com>
Subject: Re: [PATCH v3 1/3] firmware: xilinx: Add reset API's
Date: Thu, 24 Jan 2019 10:49:21 +0100
Message-ID: <e0f6e1d3-e443-040e-8c07-79359e2af37a@xilinx.com>
References: <20190125074654.10950-1-nava.manne@xilinx.com>
 <20190125074654.10950-2-nava.manne@xilinx.com>
 <1548322989.6014.4.camel@pengutronix.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <1548322989.6014.4.camel@pengutronix.de>
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
To: Philipp Zabel <p.zabel@pengutronix.de>, Nava kishore Manne <nava.manne@xilinx.com>, robh+dt@kernel.org, mark.rutland@arm.com, michal.simek@xilinx.com, rajanv@xilinx.com, jollys@xilinx.com, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, chinnikishore369@gmail.com
List-Id: devicetree@vger.kernel.org

On 24. 01. 19 10:43, Philipp Zabel wrote:
> On Fri, 2019-01-25 at 13:16 +0530, Nava kishore Manne wrote:
>> This Patch Adds reset API's to support release, assert
>> and status functionalities by using firmware interface.
>>
>> Signed-off-by: Nava kishore Manne <nava.manne@xilinx.com>
> 
> Michal, Should I merge this through the reset tree together with the
> reset driver?

It would be better if this goes via my tree. There is at least one
series which also touches the same parts in these files that's why there
will be collisions.

If you can review that I will take it via my tree and arm-soc guys to
mainline.

Thanks,
Michal
