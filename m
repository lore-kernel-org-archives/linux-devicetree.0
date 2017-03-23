From: Shawn Lin <shawn.lin@rock-chips.com>
Subject: Re: [PATCH v2 0/2] Fix memory leak in
 of_pci_get_host_bridge_resources
Date: Thu, 23 Mar 2017 17:00:47 +0800
Message-ID: <1b2060aa-09e9-64c8-833f-9d39bb5bc4c3@rock-chips.com>
References: <1490256755-889-1-git-send-email-jeffy.chen@rock-chips.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=gbk; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-pci-owner@vger.kernel.org>
In-Reply-To: <1490256755-889-1-git-send-email-jeffy.chen@rock-chips.com>
Sender: linux-pci-owner@vger.kernel.org
To: Jeffy Chen <jeffy.chen@rock-chips.com>
Cc: linux-kernel@vger.kernel.org, robh@kernel.org, toshi.kani@hpe.com, briannorris@chromium.org, dianders@chromium.org, bhelgaas@google.com, dtor@chromium.org, devicetree@vger.kernel.org, linux-pci@vger.kernel.org, Frank Rowand <frowand.list@gmail.com>, Rob Herring <robh+dt@kernel.org>
List-Id: devicetree@vger.kernel.org

Hi Jeffy,

On 2017/3/23 16:12, Jeffy Chen wrote:
> In of_pci_get_host_bridge_resources, we alloced some struct resource
> variables, and they would cause memory leak since no where to free them.
>

Tested-by: Shawn Lin <shawn.lin@rock-chips.com>

> Changes in v2:
> Don't change the resource_list_create_entry's behavior.
>
> Jeffy Chen (2):
>   PCI: return resource_entry in pci_add_resource helpers
>   of/pci: Fix memory leak in of_pci_get_host_bridge_resources
>
>  drivers/of/of_pci.c | 57 +++++++++++++++++++++++------------------------------
>  drivers/pci/bus.c   | 13 +++++++-----
>  include/linux/pci.h |  8 +++++---
>  3 files changed, 38 insertions(+), 40 deletions(-)
>
