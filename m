From: Saravana Kannan <saravanak@google.com>
Subject: Re: "of/platform: Pause/resume sync state during init and
 of_platform_populate()" with a warning on arm64
Date: Tue, 6 Aug 2019 18:22:59 -0700
Message-ID: <CAGETcx_TYxgohR7C5SRRbSmfKNhS90i64KjtA38N19g_Kz3euA@mail.gmail.com>
References: <B4B0AD7F-FA0F-4DA0-9A8B-EAE1CEE11759@lca.pw>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <B4B0AD7F-FA0F-4DA0-9A8B-EAE1CEE11759@lca.pw>
Sender: linux-kernel-owner@vger.kernel.org
To: Qian Cai <cai@lca.pw>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-arm-kernel@lists.infradead.org, Rob Herring <robh+dt@kernel.org>, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, Linux List Kernel Mailing <linux-kernel@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

On Tue, Aug 6, 2019 at 5:46 PM Qian Cai <cai@lca.pw> wrote:
>
> It looks like the linux-next commit =E2=80=9Cof/platform: Pause/resume sy=
nc state during init and of_platform_populate()=E2=80=9D [1]
> Introduced a warning while booting arm64.
>
> [1] https://lore.kernel.org/lkml/20190731221721.187713-6-saravanak@google=
.com/
>
> [   93.449300][    T1] arm-smmu-v3 arm-smmu-v3.4.auto: ias 44-bit, oas 44=
-bit (features 0x0000170d)
> [   93.464873][    T1] arm-smmu-v3 arm-smmu-v3.4.auto: allocated 524288 e=
ntries for cmdq
> [   93.485481][    T1] arm-smmu-v3 arm-smmu-v3.4.auto: allocated 524288 e=
ntries for evtq
> [   93.496320][    T1] arm-smmu-v3 arm-smmu-v3.5.auto: option mask 0x2
> [   93.502917][    T1] arm-smmu-v3 arm-smmu-v3.5.auto: ias 44-bit, oas 44=
-bit (features 0x0000170d)
> [   93.621818][    T1] arm-smmu-v3 arm-smmu-v3.5.auto: allocated 524288 e=
ntries for cmdq
> [   93.643000][    T1] arm-smmu-v3 arm-smmu-v3.5.auto: allocated 524288 e=
ntries for evtq
> [   94.519445][    T1] libphy: Fixed MDIO Bus: probed
> [   94.524649][    T1] EFI Variables Facility v0.08 2004-May-17
> [   94.601166][    T1] NET: Registered protocol family 17
> [   94.766008][    T1] zswap: loaded using pool lzo/zbud
> [   94.774745][    T1] kmemleak: Kernel memory leak detector initialized =
(mempool size: 16384)
> [   94.774756][ T1699] kmemleak: Automatic memory scanning thread started
> [   94.812338][ T1368] pcieport 0000:0f:00.0: Adding to iommu group 0
> [   94.984466][    T1] ------------[ cut here ]------------
> [   94.989827][    T1] Unmatched sync_state pause/resume!
> [   94.989894][    T1] WARNING: CPU: 25 PID: 1 at drivers/base/core.c:691=
 device_links_supplier_sync_state_resume+0x100/0x128
> [   95.006062][    T1] Modules linked in:
> [   95.009815][    T1] CPU: 25 PID: 1 Comm: swapper/0 Not tainted 5.3.0-r=
c3-next-20190806+ #11
> [   95.018161][    T1] Hardware name: HPE Apollo 70             /C01_APAC=
HE_MB         , BIOS L50_5.13_1.11 06/18/2019
> [   95.028593][    T1] pstate: 60400009 (nZCv daif +PAN -UAO)
> [   95.034077][    T1] pc : device_links_supplier_sync_state_resume+0x100=
/0x128
> [   95.041124][    T1] lr : device_links_supplier_sync_state_resume+0x100=
/0x128
> [   95.048167][    T1] sp : 34ff800806e6fbc0
> [   95.052172][    T1] x29: 34ff800806e6fc00 x28: 0000000000000000
> [   95.058177][    T1] x27: 0000000000000000 x26: 0000000000000000
> [   95.064181][    T1] x25: 0000000000000038 x24: 0000000000000000
> [   95.070185][    T1] x23: 0000000000000000 x22: 0000000000000019
> [   95.076189][    T1] x21: 0000000000000000 x20: f9ff808b804e6c50
> [   95.082193][    T1] x19: ffff100014a6e600 x18: 0000000000000040
> [   95.088197][    T1] x17: 0000000000000000 x16: 86ff80099d581b50
> [   95.094201][    T1] x15: 0000000000000000 x14: ffff100010086d1c
> [   95.100205][    T1] x13: ffff1000109d8688 x12: ffffffffffffffff
> [   95.106209][    T1] x11: 00000000000000f9 x10: ffff0808b804e6c6
> [   95.112213][    T1] x9 : 4b71ad522c851d00 x8 : 4b71ad522c851d00
> [   95.118217][    T1] x7 : 6170206574617473 x6 : ffff100014076972
> [   95.124221][    T1] x5 : 34ff800806e6f8f0 x4 : 000000000000000f
> [   95.130225][    T1] x3 : ffff1000101bfa5c x2 : 0000000000000001
> [   95.136229][    T1] x1 : 0000000000000001 x0 : 0000000000000022
> [   95.142233][    T1] Call trace:
> [   95.145374][    T1]  device_links_supplier_sync_state_resume+0x100/0x1=
28
> [   95.152074][    T1]  of_platform_sync_state_init+0x10/0x1c
> [   95.157557][    T1]  do_one_initcall+0x2f8/0x600
> [   95.162172][    T1]  do_initcall_level+0x37c/0x3fc
> [   95.166959][    T1]  do_basic_setup+0x34/0x4c
> [   95.171313][    T1]  kernel_init_freeable+0x188/0x24c
> [   95.176363][    T1]  kernel_init+0x18/0x334
> [   95.180543][    T1]  ret_from_fork+0x10/0x18
> [   95.184809][    T1] ---[ end trace a9ea68c902540fe5 ]---
> [   95.269085][    T1] Freeing unused kernel memory: 28672K
> [  101.069860][    T1] Checked W+X mappings: passed, no W+X pages found
> [  101.076265][    T1] Run /init as init process
> [  101.186359][    T1] systemd[1]: System time before build time, advanci=
ng clock.


I tested it again on my device (on an older kernel) and I don't see
this warning. Is this on an ARM64 target without a populated DT?
That's the only thing I can see that could cause this warning.

This is literally the code with the matching pause/resume. I can't
think of any other way the pause/resume could have ended up not
matching.

static int __init of_platform_default_populate_init(void)
{
        struct device_node *node;

        if (!of_have_populated_dt())
                return -ENODEV;

        platform_bus_type.add_links =3D of_link_to_suppliers;
        device_links_supplier_sync_state_pause(); <=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D PAUSE
        /*
         * Handle certain compatibles explicitly, since we don't want to cr=
eate
         * platform_devices for every node in /reserved-memory with a
         * "compatible",
         */
        for_each_matching_node(node, reserved_mem_matches)
                of_platform_device_create(node, NULL, NULL);

        node =3D of_find_node_by_path("/firmware");
        if (node) {
                of_platform_populate(node, NULL, NULL, NULL);
                of_node_put(node);
        }

        /* Populate everything else. */
        of_platform_default_populate(NULL, NULL, NULL);

        return 0;
}
arch_initcall_sync(of_platform_default_populate_init);

static int __init of_platform_sync_state_init(void)
{
        device_links_supplier_sync_state_resume(); <=3D=3D=3D=3D=3D=3D=3D=
=3D=3D RESUME
        return 0;
}
late_initcall_sync(of_platform_sync_state_init);

Thanks,
Saravana
