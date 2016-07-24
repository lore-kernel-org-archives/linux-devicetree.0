From: Hoan Tran <hotran@apm.com>
Subject: Re: hwmon: xgene: Add support for X-Gene hwmon driver
Date: Sat, 23 Jul 2016 20:00:52 -0700
Message-ID: <9D204F6B-7C99-4543-87BF-4D9FC3F6475C@apm.com>
References: <02814a96-c620-c4af-e278-40432f6f701f@riken.jp>
Mime-Version: 1.0 (1.0)
Content-Type: text/plain;
	charset=us-ascii
Content-Transfer-Encoding: 8BIT
Return-path: <linux-doc-owner@vger.kernel.org>
In-Reply-To: <02814a96-c620-c4af-e278-40432f6f701f@riken.jp>
Sender: linux-doc-owner@vger.kernel.org
To: Itaru Kitayama <itaru.kitayama@riken.jp>
Cc: Jean Delvare <jdelvare@suse.com>, Guenter Roeck <linux@roeck-us.net>, Jonathan Corbet <corbet@lwn.net>, Rob Herring <robh+dt@kernel.org>, Jassi Brar <jassisinghbrar@gmail.com>, Ashwin Chaugule <ashwin.chaugule@linaro.org>, Duc Dang <dhdang@apm.com>, lho@apm.com, linux-hwmon@vger.kernel.org, linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Hi Itaru,


> On Jul 23, 2016, at 16:51, Itaru Kitayama <itaru.kitayama@riken.jp> wrote:
> 
> Hi Hoan,
> 
> I've been testing your patch set on a Rev B0 system with ACPI, in dmesg
> I see:
> 
> [    1.546444] xgene-slimpro-i2c APMC0D40:00: i2c mailbox channel request failed
> [    1.570062] xgene-slimpro-hwmon APMC0D29:00: no pcc-channel property
> 
> what other packages or subsystems do we need to make this work on ACPI-based systems?

You need the new firmware and BIOS which support ACPI PCC mailbox.

Thanks
Hoan

> 
> Itaru
