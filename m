From: Sekhar Nori <nsekhar@ti.com>
Subject: Re: [PATCH 0/3] A/C and Sound device tree nodes for LEGO MINDSTORMS
 EV3
Date: Tue, 7 Mar 2017 16:11:52 +0530
Message-ID: <b12bc88f-5b74-7e30-6e8a-d85cc035ffd6@ti.com>
References: <1486495329-2789-1-git-send-email-david@lechnology.com>
 <21109106-99fc-aefb-a7e0-6e668cfde126@ti.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <21109106-99fc-aefb-a7e0-6e668cfde126@ti.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: David Lechner <david@lechnology.com>, linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org
Cc: Mark Rutland <mark.rutland@arm.com>, Kevin Hilman <khilman@baylibre.com>, Rob Herring <robh+dt@kernel.org>, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Monday 20 February 2017 04:06 PM, Sekhar Nori wrote:
> On Wednesday 08 February 2017 12:52 AM, David Lechner wrote:
>> This series adds device tree nodes for an analog/digital convert and for sound
>> on LEGO MINDSTORMS EV3. The device tree bindings for these nodes have been acked
>> and the drivers used by these nodes have been in linux-next for a couple weeks
>> now and as far as I know, will be included in mainline v4.11.
>>
>> This series has been tested on LEGO MINDSTORMS EV3 using next-20170207 merged
>> with linux-davinci/master.
> 
> Looks good to me. Will wait for device tree maintainers. And also for
> v4.11-rc1 to come out.

Applied now.

Thanks,
Sekhar
