From: Boris Brezillon <boris.brezillon@collabora.com>
Subject: Re: [PATCH v2 1/5] i3c: master: detach and free device if
 pre_assign_dyn_addr() fails
Date: Tue, 3 Sep 2019 12:52:37 +0200
Message-ID: <20190903125237.13a382b2@collabora.com>
References: <cover.1567437955.git.vitor.soares@synopsys.com>
        <105a3ac1653e9ae658056a5ec9ddc2a084a61669.1567437955.git.vitor.soares@synopsys.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <105a3ac1653e9ae658056a5ec9ddc2a084a61669.1567437955.git.vitor.soares@synopsys.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Vitor Soares <Vitor.Soares@synopsys.com>
Cc: linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, linux-i3c@lists.infradead.org, bbrezillon@kernel.org, robh+dt@kernel.org, mark.rutland@arm.com, pgaj@cadence.com, Joao.Pinto@synopsys.com
List-Id: devicetree@vger.kernel.org

On Tue,  3 Sep 2019 12:35:50 +0200
Vitor Soares <Vitor.Soares@synopsys.com> wrote:

> On pre_assing_dyn_addr() the devices that fail:
>   i3c_master_setdasa_locked()
>   i3c_master_reattach_i3c_dev()
>   i3c_master_retrieve_dev_info()
> 
> are kept in memory and master->bus.devs list. This makes the i3c devices
> without a dynamic address are sent on DEFSLVS CCC command. Fix this by
> detaching and freeing the devices that fail on pre_assign_dyn_addr().
> 
> Signed-off-by: Vitor Soares <vitor.soares@synopsys.com>
> ---
> Changes in v2:
>   - Move out detach/free the i3c_dev_desc from pre_assign_dyn_addr()

So, you decided to ignore my comment about leaving the i3c_dev_desc
allocated and skipping entries that don't have a dynamic address when
forging the DEFSLVS frame instead of doing this
allocate/free/re-allocate dance, and more importantly, you didn't even
bother explaining why.

I'm not willing to accept this patch unless you come up with solid
reasons.
