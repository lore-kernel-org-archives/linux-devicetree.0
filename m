From: Sergei Ianovich <ynvich@gmail.com>
Subject: Re: [PATCH v4 13/21] misc: support for LP-8x4x custom parallel bus
Date: Wed, 16 Apr 2014 23:53:58 +0400
Message-ID: <fff1a89e-346c-45fd-9832-7484bdc3561a@email.android.com>
References: <1397668411-27162-7-git-send-email-ynvich@gmail.com> <1397668667-27328-1-git-send-email-ynvich@gmail.com> <1397668667-27328-7-git-send-email-ynvich@gmail.com> <20140416194109.3ef914d2@alan.etchedpixels.co.uk>
Mime-Version: 1.0
Content-Type: text/plain;
 charset=UTF-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-doc-owner@vger.kernel.org>
In-Reply-To: <20140416194109.3ef914d2@alan.etchedpixels.co.uk>
Sender: linux-doc-owner@vger.kernel.org
To: One Thousand Gnomes <gnomes@lxorguk.ukuu.org.uk>
Cc: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, Randy Dunlap <rdunlap@infradead.org>, Russell King <linux@arm.linux.org.uk>, Arnd Bergmann <arnd@arndb.de>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Grant Likely <grant.likely@linaro.org>, Heikki Krogerus <heikki.krogerus@linux.intel.com>, devicetree@vger.kernel.org, linux-doc@vger.kernel.org
List-Id: devicetree@vger.kernel.org

One Thousand Gnomes <gnomes@lxorguk.ukuu.org.uk> wrote:
>On Wed, 16 Apr 2014 21:17:18 +0400
>Sergei Ianovich <ynvich@gmail.com> wrote:
>
>> This patch implements probing for the bus and reporting the number
>> of available expansion slots.
>
>This appears to be a bus not a misc device. I don't think it belongs in
>misc. As you've got devices on this bus (or nailed into the 'bus'
>driver)
>perhaps this belongs as drivers/platform/lp8x4x or similar with any
>specific drivers split out - or even drivers/lp8x4x if there will be
>more
>of them and more than one platform using it ?

Thanks again for responding. I don't have a clear idea about proper code organization concering this bus.

The total number of possible bus devices is quite large, around 30. Half of them would take less than 10 extra lines to get support. The rest is more complicated.

LP-8x4x has several features that would require a misc device anyway. It has a rotary switch which isn't an input device, because it produces no interrupts. The device also has a similar DIP switch. In addition, it acts as a kind of RS-485-port-to-multi-RS-232-ports logical bridge. It has a multiplexer which allows to talk to several serial modules which support a custom protocol designed for RS-485 using a RS-232 port.




