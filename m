From: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Subject: Re: [PATCH v2 0/5] Add R8A77980/Condor/V3HSK LVDS/HDMI support
Date: Fri, 8 Jun 2018 11:51:17 +0300
Message-ID: <12b910a6-d7c6-8d8a-07f2-989e26a010e0@cogentembedded.com>
References: <390fabf0-4caf-1600-3780-1893207d94f7@cogentembedded.com>
 <20180608082125.tjnd6jayecv26csv@verge.net.au>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20180608082125.tjnd6jayecv26csv@verge.net.au>
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
To: Simon Horman <horms@verge.net.au>
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org, Magnus Damm <magnus.damm@gmail.com>, Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will.deacon@arm.com>, linux-renesas-soc@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

On 6/8/2018 11:21 AM, Simon Horman wrote:

>> Here's the set of 5 patches against Simon Horman's 'renesas.git' repo's
>> 'renesas-devel-20180604-v4.17' tag. We're adding the R8A77980 FCPVD/VSPD/
>> DU/LVDS device nodes and then describing the LVDS decoder and HDMI encoder
>> connected to the LVDS output. These patches depend on the Thine THC63LVD1024
>> driver and the R8A77980 LVDS support patch in order to work, and R8A77980 GPIO
>> DT patches in order to apply/compile...
>>
>> [1/5] arm64: dts: renesas: r8a77980: add FCPVD support
>> [2/5] arm64: dts: renesas: r8a77980: add VSPD support
>> [3/5] arm64: dts: renesas: r8a77980: add DU support
>> [4/5] arm64: dts: renesas: r8a77980: add LVDS support
>> [5/5] arm64: dts: renesas: condor/v3hsk: add DU/LVDS/HDMI support
> 
> Sergei,
> 
> what are the changes in this series between v1 and v2?

    See patch #5. I've added the V3HSK DT update there...

MBR, Sergei
