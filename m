From: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Subject: [PATCH v2 0/3] Add Renesas R8A77980 GEther support
Date: Fri, 18 May 2018 21:28:29 +0300
Message-ID: <f30c98ff-f6da-9e7f-c637-49076a428885@cogentembedded.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <netdev-owner@vger.kernel.org>
Content-Language: en-MW
Sender: netdev-owner@vger.kernel.org
To: netdev@vger.kernel.org, devicetree@vger.kernel.org, "David S. Miller" <davem@davemloft.net>, Rob Herring <robh+dt@kernel.org>
Cc: Mark Rutland <mark.rutland@arm.com>, linux-renesas-soc@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Hello!

Here's a set of 3 patches against DaveM's 'net-next.git' repo. They (gradually)
add R8A77980 GEther support to the 'sh_eth' driver, starting with couple new
register bits/values introduced with this chip, and ending with adding a new
'struct sh_eth_cpu_data' instance connected to the new DT "compatible" prop
value...

[1/1] sh_eth: add RGMII support
[2/3] sh_eth: add EDMR.NBST support
[3/3] sh_eth: add R8A77980 support

MBR, Sergei
