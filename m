From: Jassi Brar <jassisinghbrar@gmail.com>
Subject: Re: [PATCH v4 1/3] mailbox: Add support for APM X-Gene platform
 mailbox driver
Date: Tue, 2 Feb 2016 10:44:00 +0530
Message-ID: <CABb+yY1cE152ZdfK_aeB8ufG=WfoUVB6BN8kXPphYgMBnpH-GA@mail.gmail.com>
References: <CABb+yY2zHycEmsVvp8OFwpJ1PZgrEPpV-oOe56wgFJ=EE0nTcg@mail.gmail.com>
	<cover.1452912126.git.dhdang@apm.com>
	<abff73c051fd06a9dd3b04a1e7957ad5a9b69a18.1452912126.git.dhdang@apm.com>
	<CADaLNDmSiK27wYBSo8-DsafmG5jUumUR5WYgConeSFXGNjH6+w@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <CADaLNDmSiK27wYBSo8-DsafmG5jUumUR5WYgConeSFXGNjH6+w@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Duc Dang <dhdang@apm.com>
Cc: Paul Bolle <pebolle@tiscali.nl>, Rob Herring <robh@kernel.org>, Devicetree List <devicetree@vger.kernel.org>, linux-arm <linux-arm-kernel@lists.infradead.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, patches <patches@apm.com>, Feng Kan <fkan@apm.com>
List-Id: devicetree@vger.kernel.org

On Tue, Feb 2, 2016 at 1:08 AM, Duc Dang <dhdang@apm.com> wrote:
> Hi Jassi,
>
> On Fri, Jan 15, 2016 at 6:57 PM, Duc Dang <dhdang@apm.com> wrote:
>> X-Gene mailbox controller provides 8 mailbox channels, with
>> each channel has a dedicated interrupt line.
>
> Did you have a chance to look into this version 4 of my mail-box patch?
>
Seems ok, please just fix the "section mismatch" warnings reported by
the build-bot.

Thanks
