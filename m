From: Ricardo Ribalda Delgado <ricardo.ribalda-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Fwd: [PATCH] x86/devicetree: Fix compile warnings on AMD64
Date: Thu, 28 Aug 2014 15:04:04 +0200
Message-ID: <CAPybu_39pLQ6gvKOPuLNCnn46Y50QU36C5thJmxrNmCzGN+MAQ@mail.gmail.com>
References: <1407230388-14211-1-git-send-email-ricardo.ribalda@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1407230388-14211-1-git-send-email-ricardo.ribalda-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Sebastian Andrzej Siewior <bigeasy-hfZtesqFncYOwBW4kG4KsQ@public.gmane.org>, Ingo Molnar <mingo-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

---------- Forwarded message ----------
=46rom: Ricardo Ribalda Delgado <ricardo.ribalda-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Date: Tue, Aug 5, 2014 at 11:19 AM
Subject: [PATCH] x86/devicetree: Fix compile warnings on AMD64
To: Thomas Gleixner <tglx-hfZtesqFncYOwBW4kG4KsQ@public.gmane.org>, Ingo Molnar
<mingo-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, "H. Peter Anvin" <hpa-YMNOUZJC4hwAvxtiuMwx3w@public.gmane.org>, x86-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org,
Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>,
Michal Simek <monstr-pSz03upnqPeHXe+LvDLADg@public.gmane.org>, Tony Lindgren <tony-4v6yS6AI5VpBDgjK7y7TUQ@public.gmane.org>,
linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: Ricardo Ribalda Delgado <ricardo.ribalda-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>


arch/x86/kernel/devicetree.c: In function =E2=80=98ioapic_xlate=E2=80=99=
:
arch/x86/kernel/devicetree.c:294:8: warning: cast from pointer to
integer of different size [-Wpointer-to-int-cast]
  idx =3D (__force u32) domain->host_data;
        ^
arch/x86/kernel/devicetree.c: In function =E2=80=98dt_add_ioapic_domain=
=E2=80=99:
arch/x86/kernel/devicetree.c:323:4: warning: cast to pointer from
integer of different size [-Wint-to-pointer-cast]
    (void *)ioapic_num);

Signed-off-by: Ricardo Ribalda Delgado <ricardo.ribalda-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
---
 arch/x86/kernel/devicetree.c | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/arch/x86/kernel/devicetree.c b/arch/x86/kernel/devicetree.=
c
index 7db54b5..a481d1b 100644
--- a/arch/x86/kernel/devicetree.c
+++ b/arch/x86/kernel/devicetree.c
@@ -278,7 +278,8 @@ static int ioapic_xlate(struct irq_domain *domain,
 {
        struct io_apic_irq_attr attr;
        struct of_ioapic_type *it;
-       u32 line, idx;
+       u32 line;
+       unsigned long idx;
        int rc;

        if (WARN_ON(intsize < 2))
@@ -291,7 +292,7 @@ static int ioapic_xlate(struct irq_domain *domain,

        it =3D &of_ioapic_type[intspec[1]];

-       idx =3D (u32) domain->host_data;
+       idx =3D (unsigned long) domain->host_data;
        set_io_apic_irq_attr(&attr, idx, line, it->trigger, it->polarit=
y);

        rc =3D io_apic_setup_irq_pin_once(irq_find_mapping(domain, line=
),
@@ -320,7 +321,7 @@ static void dt_add_ioapic_domain(unsigned int ioapi=
c_num,
        num =3D gsi_cfg->gsi_end - gsi_cfg->gsi_base + 1;

        id =3D irq_domain_add_linear(np, num, &ioapic_irq_domain_ops,
-                       (void *)ioapic_num);
+                       (void *)((unsigned long)ioapic_num));
        BUG_ON(!id);
        if (gsi_cfg->gsi_base =3D=3D 0) {
                /*
--
2.0.1



--=20
Ricardo Ribalda
--
To unsubscribe from this list: send the line "unsubscribe devicetree" i=
n
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
