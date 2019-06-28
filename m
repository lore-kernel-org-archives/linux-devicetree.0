From: Miquel Raynal <miquel.raynal@bootlin.com>
Subject: Re: [PATCH v4 1/2] mtd: rawnand: Add Macronix Raw NAND controller
Date: Fri, 28 Jun 2019 10:44:23 +0200
Message-ID: <20190628104423.5eb3058a@xps13>
References: <1561443056-13766-1-git-send-email-masonccyang@mxic.com.tw>
        <1561443056-13766-2-git-send-email-masonccyang@mxic.com.tw>
        <20190627193635.29abff43@xps13>
        <OFDDC43C05.7B4092B5-ON48258427.001EE57E-48258427.002122D1@mxic.com.tw>
        <20190628091836.3148d450@xps13>
        <OF2EDB7089.FAD92F61-ON48258427.002D122A-48258427.002ECEF3@mxic.com.tw>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8BIT
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <OF2EDB7089.FAD92F61-ON48258427.002D122A-48258427.002ECEF3@mxic.com.tw>
Sender: linux-kernel-owner@vger.kernel.org
To: masonccyang@mxic.com.tw
Cc: anders.roxell@linaro.org, bbrezillon@kernel.org, broonie@kernel.org, christophe.kerello@st.com, computersforpeace@gmail.com, devicetree@vger.kernel.org, dwmw2@infradead.org, jianxin.pan@amlogic.com, juliensu@mxic.com.tw, lee.jones@linaro.org, liang.yang@amlogic.com, linux-kernel@vger.kernel.org, linux-mtd@lists.infradead.org, marek.vasut@gmail.com, paul@crapouillou.net, paul.burton@mips.com, richard@nod.at, stefan@agner.ch, vigneshr@ti.com
List-Id: devicetree@vger.kernel.org

Hi Mason,

masonccyang@mxic.com.tw wrote on Fri, 28 Jun 2019 16:31:16 +0800:

> Hi Miquel,
> 
> > >   
> > > > > Add a driver for Macronix raw NAND controller.   
> > > > 
> > > > Could you pass userspace major MTD tests and can you   
> attach/mount/edit
> > > > a UBI/UBIFS storage?   
> > > 
> > > mtd_debug passed and using dd utility to read and write 
> > > with md5sum checking passed.  
> > 
> > Please don't use dd, use nanddump/nandwrite/flasherase/nandbiterrs and
> > run the other tests from the mtd-utils test suite (available in
> > Buildroot for instance).
> >   
> 
> Got it.
> 
> But may I know why 'dd' utility is not preferences ?
> I generate a random data file and write to Flash by
> using dd with bs=page size and read data back from Flash.
> Checking data by md5sum.

Because dd works on block devices. MTD devices are way different. You
cannot write to OOB with dd. You cannot erase before write with dd. And
dd does not know about bad blocks. Please simply avoid using dd.

> The write and read testing data size is easily adjustable.

So are the MTD utils.

Thanks,
Miquèl
