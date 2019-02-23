From: David Summers <beagleboard@davidjohnsummers.uk>
Subject: Re: [PATCH 0/3] ARM: dts: rk3288 Tinker Board (S) updates
Date: Sat, 23 Feb 2019 19:42:59 +0000
Message-ID: <50952b1a-4645-5648-2732-8051d6ed6af2@davidjohnsummers.uk>
References: <20190217121513.22965-1-beagleboard@davidjohnsummers.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20190217121513.22965-1-beagleboard@davidjohnsummers.uk>
Content-Language: en-PH
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: heiko@sntech.de, robh+dt@kernel.org, mark.rutland@arm.com
Cc: linux-rockchip@lists.infradead.org, linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On 17/02/2019 12:15, David Summers wrote:
> Find in the following patches 3 sets of updates to the rk3288 ASUS
> Tinker Board (S) device tree. The patches consist of:
>
>         1) Changes to sd card, to remove error
>         2) Add WiFi to the device tree
>         3) Add an outline for Bluetooth to the device tree
>
> The patches have been developed by both Stefan and myself, and hence
> have both our sign off.
>
> The patches have been extensivly tested by TheSaint on ArchLinux Arm
> Forum, details:
>
> https://archlinuxarm.org/forum/viewtopic.php?f=44&t=13064&start=90
>
> Each patch has more details on what is covered.
>
> David.
>
Oh yes - should note in this covering patch, that the 1st patch to 
correct sd card detection; has been updated to v2. Now as this was the 
first patch applied, it may affect the applying the second (and third 
patch). So if these need to be updated based on the v2 version of the 
first patch - just let me know. But whilst sill in the reviewing stage, 
might as well stick with the original post for wifi.

Regards,

David.
