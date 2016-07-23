From: Itaru Kitayama <itaru.kitayama@riken.jp>
Subject: hwmon: xgene: Add support for X-Gene hwmon driver
Date: Sun, 24 Jul 2016 08:51:57 +0900
Message-ID: <02814a96-c620-c4af-e278-40432f6f701f@riken.jp>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Hoan Tran <hotran@apm.com>
Cc: linux-hwmon@vger.kernel.org, Jonathan Corbet <corbet@lwn.net>, Jean Delvare <jdelvare@suse.com>, Ashwin Chaugule <ashwin.chaugule@linaro.org>, Duc Dang <dhdang@apm.com>, Jassi Brar <jassisinghbrar@gmail.com>, linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, lho@apm.com, Guenter Roeck <linux@roeck-us.net>, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

Hi Hoan,

I've been testing your patch set on a Rev B0 system with ACPI, in dmesg
I see:

[    1.546444] xgene-slimpro-i2c APMC0D40:00: i2c mailbox channel 
request failed
[    1.570062] xgene-slimpro-hwmon APMC0D29:00: no pcc-channel property

what other packages or subsystems do we need to make this work on 
ACPI-based systems?

Itaru
