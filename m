From: Vitaly Kuznetsov <vkuznets@redhat.com>
Subject: Re: KASAN: slab-out-of-bounds Read in handle_vmptrld
Date: Thu, 12 Sep 2019 15:54:48 +0200
Message-ID: <87lfutei1j.fsf@vitty.brq.redhat.com>
References: <000000000000a9d4f705924cff7a@google.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <000000000000a9d4f705924cff7a@google.com>
Sender: linux-kernel-owner@vger.kernel.org
To: kvm@vger.kernel.org
Cc: bp@alien8.de, carlo@caione.org, catalin.marinas@arm.com, devicetree@vger.kernel.org, hpa@zytor.com, jmattson@google.com, joro@8bytes.org, khilman@baylibre.com, linux-amlogic@lists.infradead.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, mark.rutland@arm.com, mingo@redhat.com, narmstrong@baylibre.com, pbonzini@redhat.com, rkrcmar@redhat.com, robh+dt@kernel.org, sean.j.christopherson@intel.com, syzkaller-bugs@googlegroups.com, tglx@linutronix.de, wanpengli@tencent.com, will.deacon@arm.com, x86@kernel.org, syzbot <syzbot+46f1dd7dbbe2bfb98b10@syzkaller.appspotmail.com>
List-Id: devicetree@vger.kernel.org

syzbot <syzbot+46f1dd7dbbe2bfb98b10@syzkaller.appspotmail.com> writes:

> Hello,
>
> syzbot found the following crash on:
>
> HEAD commit:    1e3778cb Merge tag 'scsi-fixes' of git://git.kernel.org/pu..
> git tree:       upstream
> console output: https://syzkaller.appspot.com/x/log.txt?x=15bdfc5e600000
> kernel config:  https://syzkaller.appspot.com/x/.config?x=b89bb446a3faaba4
> dashboard link: https://syzkaller.appspot.com/bug?extid=46f1dd7dbbe2bfb98b10
> compiler:       gcc (GCC) 9.0.0 20181231 (experimental)
> syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=1709421a600000
> C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=168fc4b2600000
>
> The bug was bisected to:
>
> commit a87f854ddcf7ff7e044d72db0aa6da82f26d69a6
> Author: Neil Armstrong <narmstrong@baylibre.com>
> Date:   Wed Oct 11 15:39:40 2017 +0000
>
>      ARM64: dts: meson-gx: remove unnecessary uart compatible
>
> bisection log:  https://syzkaller.appspot.com/x/bisect.txt?x=17e78a6e600000
> final crash:    https://syzkaller.appspot.com/x/report.txt?x=14178a6e600000
> console output: https://syzkaller.appspot.com/x/log.txt?x=10178a6e600000
>
> IMPORTANT: if you fix the bug, please add the following tag to the commit:
> Reported-by: syzbot+46f1dd7dbbe2bfb98b10@syzkaller.appspotmail.com
> Fixes: a87f854ddcf7 ("ARM64: dts: meson-gx: remove unnecessary uart  
> compatible")
>
> L1TF CPU bug present and SMT on, data leak possible. See CVE-2018-3646 and  
> https://www.kernel.org/doc/html/latest/admin-guide/hw-vuln/l1tf.html for  
> details.
> ==================================================================
> BUG: KASAN: slab-out-of-bounds in handle_vmptrld  
> arch/x86/kvm/vmx/nested.c:4789 [inline]
> BUG: KASAN: slab-out-of-bounds in handle_vmptrld+0x777/0x800  
> arch/x86/kvm/vmx/nested.c:4749
> Read of size 4 at addr ffff888091e10000 by task syz-executor758/10006
>
> CPU: 1 PID: 10006 Comm: syz-executor758 Not tainted 5.3.0-rc7+ #0
> Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS  
> Google 01/01/2011
> Call Trace:
>   __dump_stack lib/dump_stack.c:77 [inline]
>   dump_stack+0x172/0x1f0 lib/dump_stack.c:113
>   print_address_description.cold+0xd4/0x306 mm/kasan/report.c:351
>   __kasan_report.cold+0x1b/0x36 mm/kasan/report.c:482
>   kasan_report+0x12/0x17 mm/kasan/common.c:618
>   __asan_report_load_n_noabort+0xf/0x20 mm/kasan/generic_report.c:142
>   handle_vmptrld arch/x86/kvm/vmx/nested.c:4789 [inline]
>   handle_vmptrld+0x777/0x800 arch/x86/kvm/vmx/nested.c:4749
>   vmx_handle_exit+0x299/0x15e0 arch/x86/kvm/vmx/vmx.c:5886
>   vcpu_enter_guest+0x1087/0x5e90 arch/x86/kvm/x86.c:8088
>   vcpu_run arch/x86/kvm/x86.c:8152 [inline]
>   kvm_arch_vcpu_ioctl_run+0x464/0x1750 arch/x86/kvm/x86.c:8360
>   kvm_vcpu_ioctl+0x4dc/0xfd0 arch/x86/kvm/../../../virt/kvm/kvm_main.c:2765
>   vfs_ioctl fs/ioctl.c:46 [inline]
>   file_ioctl fs/ioctl.c:509 [inline]
>   do_vfs_ioctl+0xdb6/0x13e0 fs/ioctl.c:696
>   ksys_ioctl+0xab/0xd0 fs/ioctl.c:713
>   __do_sys_ioctl fs/ioctl.c:720 [inline]
>   __se_sys_ioctl fs/ioctl.c:718 [inline]
>   __x64_sys_ioctl+0x73/0xb0 fs/ioctl.c:718
>   do_syscall_64+0xfd/0x6a0 arch/x86/entry/common.c:296
>   entry_SYSCALL_64_after_hwframe+0x49/0xbe

Hm, the bisection seems bogus but the stack points us to the following
piece of code:

 4776)              if (kvm_vcpu_map(vcpu, gpa_to_gfn(vmptr), &map)) {
<skip>
 4783)                      return nested_vmx_failValid(vcpu,
 4784)                              VMXERR_VMPTRLD_INCORRECT_VMCS_REVISION_ID);
 4785)              }
 4786) 
 4787)              new_vmcs12 = map.hva;
 4788) 
*4789)              if (new_vmcs12->hdr.revision_id != VMCS12_REVISION ||
 4790)                  (new_vmcs12->hdr.shadow_vmcs &&
 4791)                   !nested_cpu_has_vmx_shadow_vmcs(vcpu))) {

the reported problem seems to be on VMCS12 region access but it's part
of guest memory and we successfuly managed to map it. We're definitely
within 1-page range. Maybe KASAN is just wrong here?

-- 
Vitaly
