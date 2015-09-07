From: Gerd Hoffmann <kraxel@redhat.com>
Subject: Re: [PATCH v2] QEMU fw_cfg DMA interface documentation
Date: Mon, 07 Sep 2015 13:08:29 +0200
Message-ID: <1441624109.27149.18.camel@redhat.com>
References: <1441012133-8154-1-git-send-email-markmb@redhat.com>
	 <1441012303-8261-1-git-send-email-markmb@redhat.com>
	 <CAJSP0QXgiMo0ahzRQ=2iMXVmiO+R27Re17c966LX1T_Q=Rdgow@mail.gmail.com>
	 <20150902103311.5335d469@markmb_rh>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20150902103311.5335d469@markmb_rh>
Sender: linux-kernel-owner@vger.kernel.org
To: Marc =?ISO-8859-1?Q?Mar=ED?= <markmb@redhat.com>
Cc: Stefan Hajnoczi <stefanha@gmail.com>, linux-kernel <linux-kernel@vger.kernel.org>, Drew <drjones@redhat.com>, Kevin O'Connor <kevin@koconnor.net>, Laszlo <lersek@redhat.com>, Arnd Bergmann <arnd@arndb.de>, Rob Herring <rob.herring@linaro.org>, Mark Rutland <mark.rutland@arm.com>, Alexander Graf <agraf@suse.de>, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

  Hi,

> It's just simplicity. If you want to read a few times from the same
> field (like in ACPI tables, read the data size and then the data), you
> need a way to enable and disable the selector and manage the current
> offset for that entry. This is already provided with the "old"
> interface.

Could be handled with a 'select' control bit.  Only when set select
entry and reset offset to zero.

Also: would it make sense to allow an *array* of FWCfgDmaAccess structs?
With a 'more' bit in control we could indicate that there are more
entries.  I'm not sure firmware would actually use that though ...

cheers,
  Gerd
