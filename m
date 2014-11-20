From: Arnd Bergmann <arnd@arndb.de>
Subject: Re: [PATCH v5 0/4] Correct vendor-prefix and document device isl29028
Date: Thu, 20 Nov 2014 12:21:43 +0100
Message-ID: <201411201221.43308.arnd@arndb.de>
References: <1415467328-9745-1-git-send-email-darshanapadmadas@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <driverdev-devel-bounces@linuxdriverproject.org>
In-Reply-To: <1415467328-9745-1-git-send-email-darshanapadmadas@gmail.com>
List-Unsubscribe: <http://driverdev.linuxdriverproject.org/mailman/options/driverdev-devel>,
 <mailto:driverdev-devel-request@linuxdriverproject.org?subject=unsubscribe>
List-Archive: <http://driverdev.linuxdriverproject.org/pipermail/driverdev-devel/>
List-Post: <mailto:driverdev-devel@linuxdriverproject.org>
List-Help: <mailto:driverdev-devel-request@linuxdriverproject.org?subject=help>
List-Subscribe: <http://driverdev.linuxdriverproject.org/mailman/listinfo/driverdev-devel>,
 <mailto:driverdev-devel-request@linuxdriverproject.org?subject=subscribe>
Errors-To: driverdev-devel-bounces@linuxdriverproject.org
Sender: "devel" <driverdev-devel-bounces@linuxdriverproject.org>
To: linux-arm-kernel@lists.infradead.org
Cc: devel@driverdev.osuosl.org, devicetree@vger.kernel.org, linux-iio@vger.kernel.org, linux-kernel@vger.kernel.org, opw-kernel@googlegroups.com, Darshana Padmadas <darshanapadmadas@gmail.com>
List-Id: devicetree@vger.kernel.org

On Saturday 08 November 2014, Darshana Padmadas wrote:
> Patchset documents correct and the deprecated vendor-prefix found by checkpatch
> warning and also documents information of device isl29028 for compatibility.
> Patchset also includes corrected vendor-prefix and device name in compatible
> property for files with checkpatch warning of undocumented string "isil,isl29028".
> 

Since nobody else has picked these up, I've put them into the arm-soc
tree in the next/dt branch now.

Thanks and sorry for the delay,

	Arnd
