From: Dinh Nguyen <dinh.linux@gmail.com>
Subject: Re: [PATCHv2 3/3] arm64: dts: stratix10: add sdram ecc
Date: Tue, 8 May 2018 14:27:29 -0500
Message-ID: <CADhT+wc_WfT-F29dHu=XQeS6Y9QL0nb=L1u5VFUObjp1Kw9eaA@mail.gmail.com>
References: <1524854238-19394-1-git-send-email-thor.thayer@linux.intel.com>
 <1524854238-19394-4-git-send-email-thor.thayer@linux.intel.com>
 <20180507165943.GE733@pd.tnic>
 <CADhT+weyJFhMyPbVt0n2EVe7OpeHHLjhxjw7aY2_8GBZ-7h7Xg@mail.gmail.com>
 <CADhT+weL=8ODk1JVLwUXtFG3e4iKfzBMpZmo4Y0UwoK0=H=Zhg@mail.gmail.com>
 <20180508085330.GA12190@pd.tnic>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20180508085330.GA12190@pd.tnic>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Borislav Petkov <bp@alien8.de>
Cc: Mark Rutland <mark.rutland@arm.com>, Rob Herring <robh@kernel.org>, thor.thayer@linux.intel.com, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will.deacon@arm.com>, Dinh Nguyen <dinguyen@kernel.org>, Rob Herring <robh+dt@kernel.org>, mchehab@kernel.org, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, linux-edac@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Hi Boris,

On Tue, May 8, 2018 at 3:53 AM, Borislav Petkov <bp@alien8.de> wrote:
> On Mon, May 07, 2018 at 04:10:01PM -0500, Dinh Nguyen wrote:
>> Do you mind if I take this patch through arm-soc?
>
> Sure, but you have to give me an immutable branch which I can merge into
> my tree so that the functionality in 2/3 can get used when it lands in
> linux-next and later in mainline.
>
> So please take it and give me the tag (I see you're using tags) which
> you're sending up.
>

Please this tag socfpga_updates_for_v4.18_part2  at :

git://git.kernel.org/pub/scm/linux/kernel/git/dinguyen/linux.git

Thanks,
Dinh
