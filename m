From: kbuild test robot <lkp-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH v8] arm64: dts: sdm845: Add gpu and gmu
 device nodes
Date: Mon, 21 Jan 2019 09:49:19 +0800
Message-ID: <201901210901.DmsvvntI%fengguang.wu@intel.com>
References: <1547661809-31184-1-git-send-email-jcrouse@codeaurora.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <freedreno-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1547661809-31184-1-git-send-email-jcrouse-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/freedreno>,
 <mailto:freedreno-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/freedreno>
List-Post: <mailto:freedreno-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:freedreno-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/freedreno>,
 <mailto:freedreno-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Errors-To: freedreno-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Sender: "Freedreno" <freedreno-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
To: Jordan Crouse <jcrouse-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
Cc: Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, rnayak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org, linux-arm-msm-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, dianders-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org, David Brown <david.brown-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, kbuild-all-JC7UmRfGjtg@public.gmane.org, Andy Gross <andy.gross-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, freedreno-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
List-Id: devicetree@vger.kernel.org

SGkgSm9yZGFuLAoKVGhhbmsgeW91IGZvciB0aGUgcGF0Y2ghIFlldCBzb21ldGhpbmcgdG8gaW1w
cm92ZToKClthdXRvIGJ1aWxkIHRlc3QgRVJST1Igb24gdjUuMC1yYzJdCltpZiB5b3VyIHBhdGNo
IGlzIGFwcGxpZWQgdG8gdGhlIHdyb25nIGdpdCB0cmVlLCBwbGVhc2UgZHJvcCB1cyBhIG5vdGUg
dG8gaGVscCBpbXByb3ZlIHRoZSBzeXN0ZW1dCgp1cmw6ICAgIGh0dHBzOi8vZ2l0aHViLmNvbS8w
ZGF5LWNpL2xpbnV4L2NvbW1pdHMvSm9yZGFuLUNyb3VzZS9hcm02NC1kdHMtc2RtODQ1LUFkZC1n
cHUtYW5kLWdtdS1kZXZpY2Utbm9kZXMvMjAxOTAxMTgtMDUxNjUxCmNvbmZpZzogYXJtNjQtYWxs
eWVzY29uZmlnCmNvbXBpbGVyOiBhYXJjaDY0LWxpbnV4LWdudS1nY2MgKERlYmlhbiA4LjIuMC0x
MSkgOC4yLjAKcmVwcm9kdWNlOgogICAgICAgIHdnZXQgaHR0cHM6Ly9yYXcuZ2l0aHVidXNlcmNv
bnRlbnQuY29tL2ludGVsL2xrcC10ZXN0cy9tYXN0ZXIvc2Jpbi9tYWtlLmNyb3NzIC1PIH4vYmlu
L21ha2UuY3Jvc3MKICAgICAgICBjaG1vZCAreCB+L2Jpbi9tYWtlLmNyb3NzCiAgICAgICAgR0ND
X1ZFUlNJT049OC4yLjAgbWFrZS5jcm9zcyBBUkNIPWFybTY0ICBhbGx5ZXNjb25maWcKICAgICAg
ICBHQ0NfVkVSU0lPTj04LjIuMCBtYWtlLmNyb3NzIEFSQ0g9YXJtNjQgCgpBbGwgZXJyb3JzIChu
ZXcgb25lcyBwcmVmaXhlZCBieSA+Pik6CgotLS0KMC1EQVkga2VybmVsIHRlc3QgaW5mcmFzdHJ1
Y3R1cmUgICAgICAgICAgICAgICAgT3BlbiBTb3VyY2UgVGVjaG5vbG9neSBDZW50ZXIKaHR0cHM6
Ly9saXN0cy4wMS5vcmcvcGlwZXJtYWlsL2tidWlsZC1hbGwgICAgICAgICAgICAgICAgICAgSW50
ZWwgQ29ycG9yYXRpb24KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX18KRnJlZWRyZW5vIG1haWxpbmcgbGlzdApGcmVlZHJlbm9AbGlzdHMuZnJlZWRlc2t0b3Au
b3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZnJlZWRy
ZW5vCg==
