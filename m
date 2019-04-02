From: Sasha Levin <sashal@kernel.org>
Subject: Re: [PATCH 1/2] ftpm: dt-binding: add dts documentation for fTPM
 driver
Date: Tue, 2 Apr 2019 16:03:51 -0400
Message-ID: <20190402200351.GC19373@sasha-vm>
References: <20190402193316.15144-1-sashal@kernel.org>
 <20190402193732.GA26193@kroah.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20190402193732.GA26193@kroah.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Greg KH <gregkh@linuxfoundation.org>
Cc: robh+dt@kernel.org, mark.rutland@arm.com, peterhuewe@gmx.de, jarkko.sakkinen@linux.intel.com, jgg@ziepe.ca, linux-kernel@microsoft.com, bryankel@microsoft.com, thiruan@microsoft.com, suredd@microsoft.com, arnd@arndb.de, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-integrity@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Tue, Apr 02, 2019 at 09:37:32PM +0200, Greg KH wrote:
>On Tue, Apr 02, 2019 at 03:33:15PM -0400, Sasha Levin wrote:
>> Signed-off-by: Sasha Levin <sashal@kernel.org>
>> ---
>
>I know I don't take patches without any changelog text :)

I honestly don't have anything meaningful to add in the changelog, and
looking at similar commits under Documentation/devicetree/bindings/ that
just add a new binding, they have a very similar changelog as well (see
204d94e63e22, 772bf73ed4dc, and b805c403c859 for example).

While I could add meaningless text which basically copies the subject
line, I don't think it will solve the concern you're pointing out here.

There is a lot of documentation for the fTPM driver which is listed in
the following patch, but it's not relevant to this patch at all.

--
Thanks,
Sasha
