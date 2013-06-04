From: Heiko =?utf-8?q?St=C3=BCbner?= <heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org>
Subject: Re: [PATCH v2 1/4] clocksource: dw_apb_timer_of: enable the use the
 clocksource as sched clock
Date: Tue, 4 Jun 2013 12:52:07 +0200
Message-ID: <201306041252.07877.heiko@sntech.de>
References: <201306041136.09566.heiko@sntech.de>
 <201306041137.03319.heiko@sntech.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <201306041137.03319.heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss/>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Sender: "devicetree-discuss"
 <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
To: John Stultz <john.stultz-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Cc: Baruch Siach <baruch-NswTu9S1W3P6gbPvEgmw2w@public.gmane.org>, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Rob Herring <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>, Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Jamie Iles <jamie-wmLquQDDieKakBO8gow8eQ@public.gmane.org>, Thomas Gleixner <tglx-hfZtesqFncYOwBW4kG4KsQ@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

QW0gRGllbnN0YWcsIDQuIEp1bmkgMjAxMywgMTE6Mzc6MDIgc2NocmllYiBIZWlrbyBTdMO8Ym5l
cjoKPiBDdXJyZW50bHkgdGhlIGR3X2FwYl90aW1lciBhbHdheXMgZXhwZWN0cyBhIHNlcGFyYXRl
IHNwZWNpYWwgdGltZXIgdG8gYmUKPiBhdmFpbGJhYmxlIGZvciB0aGUgc2NoZWRfY2xvY2suIFNv
bWUgZGV2aWNlcyB1c2luZyBkd19hcGJfdGltZXJzIGRvIG5vdAo+IGhhdmUgdGhpcyBzcHRpbWVy
IGJ1dCBjYW4gdXNlIHRoZSBjbG9ja3NvdXJjZSBhcyBzY2hlZF9jbG9jayBpbnN0ZWFkLgo+IAo+
IFRoZXJlZm9yZSBlbmFibGUgdGhlIGRyaXZlciB0byBkaXN0aWd1aXNoIGJldHdlZW4gZGV2aWNl
cyB3aXRoIGFuZCB3aXRob3V0Cj4gc3B0aW1lciBiYXNlZCBvbiB0aGUgZGV2aWNldHJlZSBkYXRh
IGFuZCBzZWxlY3QgdGhlIGNvcnJlY3QgdGltZXIgYXMKPiBzY2hlZF9jbG9jay4KPiAKPiBTaWdu
ZWQtb2ZmLWJ5OiBIZWlrbyBTdHVlYm5lciA8aGVpa29Ac250ZWNoLmRlPgoKaW4gdGhlIG9yaWdp
bmFsIHRocmVhZCAiYXJtOiBhZGQgYmFzaWMgc3VwcG9ydCBmb3IgUm9ja2NoaXAgQ29ydGV4LUE5
IFNvQ3MiIAp0aGlzIHBhdGNoIHdpdGggdGhlIHVwZGF0ZWQgZGVzY3JpcHRpb24gbm93IGFsc28g
Z290IGEKCgpBY2tlZC1ieTogTGludXMgV2FsbGVpaiA8bGludXMud2FsbGVpakBsaW5hcm8ub3Jn
PgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkZXZpY2V0
cmVlLWRpc2N1c3MgbWFpbGluZyBsaXN0CmRldmljZXRyZWUtZGlzY3Vzc0BsaXN0cy5vemxhYnMu
b3JnCmh0dHBzOi8vbGlzdHMub3psYWJzLm9yZy9saXN0aW5mby9kZXZpY2V0cmVlLWRpc2N1c3MK
