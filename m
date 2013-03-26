From: Arnd Bergmann <arnd@arndb.de>
Subject: Re: [PATCH 2/3] mfd: db8500-prcmu: Fetch the PRCMU TCDM base address from Device Tree
Date: Tue, 26 Mar 2013 10:00:33 +0000
Message-ID: <201303261000.33615.arnd@arndb.de>
References: <1364223758-17621-1-git-send-email-lee.jones@linaro.org> <CACRpkdZxU197moM_00UQr-tHdip4b50c+CfYkR5OK+MbwsE-aw@mail.gmail.com> <20130326094848.GA14151@gmail.com>
Mime-Version: 1.0
Content-Type: Text/Plain;
  charset="utf-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20130326094848.GA14151@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Lee Jones <lee.jones@linaro.org>
Cc: Linus Walleij <linus.walleij@linaro.org>, devicetree-discuss@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, linus.walleij@stericsson.com
List-Id: devicetree@vger.kernel.org

On Tuesday 26 March 2013, Lee Jones wrote:
> Bit for information for you. 
> 
> I have confirmed that the address locations are the same for
> all SoCs are the same. However, the size of the TCDM changes from 4k
> on the db8500 to 12k on the db8540.
> 
> Is there a way we can increase the size for the db8540 without
> creating an entire new DTS file? Seems overkill.

You can always override a property by setting it again, like

	soc {
		prcmu: db8500-prcmu@abcd0000 {
			reg = <0xabcd0000 0x1000>;
		};
	};

...


	&prcmu {
		reg = <0xabcd0000 0x3000>;
	}



	Arnd
